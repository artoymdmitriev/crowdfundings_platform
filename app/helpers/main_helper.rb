module MainHelper
  def last_projects
    Project.last(4)
  end

  def last_successful_projects
    Project.where(state: :succeeded).last(4)
  end

  def biggest_payments
    Payment.order('amount DESC').first(6)
  end

  def last_news_items
    NewsItem.order('updated_at DESC').first(6)
  end
end
