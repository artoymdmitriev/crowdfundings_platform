module PaymentsHelper
  def biggest_payments
    Payment.order('amount DESC').first(6)
  end
end
