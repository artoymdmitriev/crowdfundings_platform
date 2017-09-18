module Checkable include ActiveSupport::Concern
  def check(payment)
    project = Project.find(payment.project.id)
    project.goals.each do |goal|
      goal.update(is_achieved: true) if payment.amount >= goal.amount
    end
  end
end