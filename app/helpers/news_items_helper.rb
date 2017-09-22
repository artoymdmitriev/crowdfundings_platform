module NewsItemsHelper
  def last_news_items
    NewsItem.order('updated_at DESC').first(6)
  end

  def check_for_rights
    !current_user.nil? && (@project.user_id == current_user.id || current_user.role == 'admin') ? true : false
  end
end
