class PaymentsController < ApplicationController
  before_action :authenticate_user!
  TRANSACTION_SUCCESS_STATUSES = [
      Braintree::Transaction::Status::Authorizing,
      Braintree::Transaction::Status::Authorized,
      Braintree::Transaction::Status::Settled,
      Braintree::Transaction::Status::SettlementConfirmed,
      Braintree::Transaction::Status::SettlementPending,
      Braintree::Transaction::Status::Settling,
      Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
    @project_id = params[:project_id]
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
        amount: amount,
        payment_method_nonce: nonce,
        :options => {
            :submit_for_settlement => true
        }
    )

    if result.success? || result.transaction
      redirect_to payment_path(result.transaction.id)
      save_to_db Braintree::Transaction.find(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_payment_path
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
          :header => "Sweet Success!",
          :icon => "success",
          :message => "Your test transaction has been successfully processed."
      }
    else
      result_hash = {
          :header => "Transaction Failed",
          :icon => "fail",
          :message => "Your test transaction has a status of #{status}."
      }
    end
  end

  private
  def save_to_db transaction_object
    p = Payment.new(last4: transaction_object.credit_card_details.last_4,
                    amount: transaction_object.amount,
                    project_id: 1,
                    user_id: current_user.id)
    p.save!
  end
end
