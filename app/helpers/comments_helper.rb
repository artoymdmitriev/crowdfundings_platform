module CommentsHelper
  def get_author_name id
    author_name = 'Undefined'
    author = User.includes(:application).find(id)
    author_name = "#{author.application.name} #{author.application.surname}" unless author.application.nil?
    return author_name
  end

  def has_badges? comment
    user = User.find(comment.user_id)
    user.badges.empty?
  end
end
