class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @comment = find_commentable.comments.create(params[:comment].permit(:text))
    @comment.user_id = current_user.id
    @comment.save
    redirect_back
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

  def check_for_rights
    unless !current_user.nil? && (@comment.user_id == current_user.id || current_user.role == 'admin')
      flash[:error] = 'You are not allowed to edit another\'s comments'
      redirect_to '/projects/'
    end
  end
end
