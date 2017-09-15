class NewsItemObserver < ActiveRecord::Observer
  observe :news_item

  def after_create(record)
    # Will send emails to subscribers in future
    # project = Project.find(record.project_id)
    # subscriptions = Subscription.find_all(project)
  end
end
