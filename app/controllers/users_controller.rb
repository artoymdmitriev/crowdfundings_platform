class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!, except: :show
  before_action :is_admin?, except: :show

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def show
    @user = User.find(params[:id])
  end

  # TODO add translations
  def change
    @users_in_hash = params[:change]
    if @users_in_hash.nil?
      redirect_to users_path
      flash[:error] = 'You must choose at least one user'
      return
    end
    choose_action
    redirect_to users_path
  end

  private
  def choose_action
    @method = params[:commit]
    if @method == (I18n.t :block_action)
      block @users_in_hash
    elsif @method == (I18n.t :unblock_action)
      unblock @users_in_hash
    elsif @method == (I18n.t :delete_action)
      delete @users_in_hash
    end
  end

  def block users_in_hash
    users_in_hash.each do |key, value|
      User.find(key).update(is_blocked: true)
    end
  end

  def unblock users_in_hash
    users_in_hash.each do |key, value|
      User.find(key).update(is_blocked: false)
    end
  end

  def delete users_in_hash
    users_in_hash.each do |key, value|
      User.find(key).delete
    end
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
