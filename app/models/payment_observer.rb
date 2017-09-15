class PaymentObserver < ActiveRecord::Observer
  observe :payment

  def after_create(record)
    project = Project.find(record.project_id)
    project.update(earned: project.earned + record.amount)
  end
end
