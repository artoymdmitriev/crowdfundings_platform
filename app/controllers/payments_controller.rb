class PaymentsController < ApplicationController
  include Checkable
  before_action :authenticate_user!
  before_action :load_project, except: :show

  def new
    @payment = @project.payments.new
  end

  def show

  end

  def create
    @payment = @project.payments.new(payments_params)
    @payment.update(user_id: current_user.id)
    @amount = (@payment.amount * 100).round
    check(@payment)
    redirect_to project_path(@project)
  rescue Stripe::CardError => e
      flash[:error] = e.message
      @payment.delete
      redirect_to project_path(@project)
 end

  private
  def load_project
    @project = Project.find(params[:project_id])
  end

  def payments_params
    params.require(:payment).permit(:amount, :project_id)
  end

  def create_customer
    @customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
    )
  end

  def create_charge
    @charge = Stripe::Charge.create(
        customer: @customer.id,
        amount: @amount,
        description: @project.name,
        currency: 'usd'
    )
  end

end
