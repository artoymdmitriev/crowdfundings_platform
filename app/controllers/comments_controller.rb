class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.create(params[:comment].permit(:text))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :back
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
