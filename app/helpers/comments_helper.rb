module CommentsHelper
  def get_author_name id
    author_name = 'Undefined'
    author = User.find(id)
    unless author.application.nil?
      author_name = "#{author.application.name} #{author.application.surname}"
    end
  end
end
