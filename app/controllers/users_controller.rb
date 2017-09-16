class UsersController < AdminController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!, except: :show
  skip_before_action :is_admin?, only: :show

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def show
    @user = User.find(params[:id])
  end

  def change
    #TODO refactor (too many lines)
    method = params[:commit]
    users_in_hash = params[:change]
    if users_in_hash.nil?
      redirect_to :back
      flash[:error] = 'You must choose at least one user'
      return
    end
    if method == (I18n.t :block_action)
      block users_in_hash
    elsif method == (I18n.t :unblock_action)
      unblock users_in_hash
    elsif method == (I18n.t :delete_action)
      delete users_in_hash
    end
    redirect_to :back
  end

  def block users_in_hash
    users_in_hash.each do |key, value|
      user = User.find(key)
      user.is_blocked = true
      user.save
    end
  end

  def unblock users_in_hash
    users_in_hash.each do |key, value|
      user = User.find(key)
      user.is_blocked = false
      user.save
    end
  end

  def delete users_in_hash
    users_in_hash.each do |key, value|
      user = User.find(key)
      user.delete
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
