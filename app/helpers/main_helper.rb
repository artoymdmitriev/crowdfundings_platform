module MainHelper
  def last_projects
    @projects = Project.last(5)
  end

  def last_users
    @users = User.last(5)
  end

  # def last_news
  #   @news = NewsItem.last(5)
  # end
end
