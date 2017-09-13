class ApplicationsController < ApplicationController
  include ApplicationsHelper
  before_action :authenticate_user!
  before_action :check_admin, only: :index
  before_action :check_if_checked_earlier, only: :update

  def index
    @applications = Application.all
  end

  def my_application
    if !current_user.application.nil?
      @application = current_user.application
    else
      puts "THERE IS NO APPLICATION"
    end
  end

  def new
    @application = Application.new
  end

  def create
    params.permit!
    @application = Application.new(params[:application])
    @application.user_id = current_user.id
    #TODO catch unique constrait
    if @application.save!
      redirect_to root_path
    else
      puts "YOU ARE STUPID"
    end
  end

  def check
    @application = Application.find_by(user_id: params[:id])
  end

  def update
    @application = Application.find_by(id: params[:id])
    update_params
    update_role
    create_notification @application
    redirect_to request.referrer
  end

  private
  def check_admin
    unless current_user.admin?
      redirect_to request.referrer
    end
  end

  def check_if_checked_earlier
    if Application.find_by(id: params[:id]).is_checked
      flash[:error] = 'You can\' perform this action. User has alread been checked.'
      redirect_to request.referrer
    end
  end

  def update_params
    if params[:deny]
      @application.update(is_confirmed: false)
    elsif params[:allow]
      @application.update(is_confirmed: true)
    end
    @application.update(is_checked: true)
  end

  def update_role
    user = User.find(@application.user_id)
    user.update(role: 'checked')
  end
end
