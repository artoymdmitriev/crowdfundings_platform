class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def block
    user = User.find(params[:id])
    user.is_blocked = true
    user.save
    redirect_to root_path
  end

  def unblock
    user = User.find(params[:id])
    user.is_blocked = false
    user.save
    redirect_to root_path
  end

  def delete
    user = User.find(params[:id])
    if(user.id == current_user.id)
      user.delete
      redirect_to '/users/sign_in'
    else
      user.delete
      redirect_to root_path
    end
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
