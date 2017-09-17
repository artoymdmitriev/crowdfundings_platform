module MainHelper
  def last_projects
    @projects = Project.last(6)
  end

  def last_users
    @users = User.last(6)
  end

  def last_news_items
    @news = NewsItem.last(6)
  end
end
