class PaymentObserver < ActiveRecord::Observer
  observe :payment

  # TODO remove
  def after_create(record)
    puts "///////////////////////////////"
    project = Project.find(record.project_id)
    project.update(earned: project.earned + record.amount)
  end
end
