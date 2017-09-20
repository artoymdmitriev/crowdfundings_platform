module Checkable include ActiveSupport::Concern
  def check(payment)
    project = Project.find(payment.project_id)
    earned_money = count_money project
    project.goals.each do |goal|
      goal.update(is_achieved: true) if earned_money >= goal.amount
    end
  end

  def count_money project
    sum = 0
    project.payments.each { |payment| sum += payment.amount }
    return sum
  end
end