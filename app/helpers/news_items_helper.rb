module NewsItemsHelper
  def last_news_items
    NewsItem.order('updated_at DESC').first(6)
  end
end
