class ApplicationsController < ApplicationController
  include ApplicationsHelper
  before_action :authenticate_user!
  before_action :check_admin, only: [:check, :update]
  before_action :check_if_checked_earlier, only: :update
  before_action :load_application, only: :update

  def new
    @application = Application.new
  end

  def create
    # TODO:  FIX
    @application = Application.create(application_params.)
    redirect_to my_projects_path
  end

  def check
    @application = Application.find_by(user_id: params[:id])
  end

  def update
    update_params
    create_notification @application
    redirect_to request.referrer || users_path
  end

  private
  def load_application
    @application ||= Application.find(params[:id])
  end

  def application_params
    params.require(:application)
        .permit(:name, :surname, :passport_image, :birthday, :comment)
        .merge(user_id: current_user.id)
  end

  def check_admin
    redirect_to request.referrer || root_path unless current_user.admin?
  end

  # TODO add translation
  def check_if_checked_earlier
    if Application.find_by(id: params[:id]).is_checked
      flash[:error] = 'You can\' perform this action. User has alread been checked.'
      redirect_to users_path
    end
  end

  def update_params
    if params[:deny]
      @application.update(is_confirmed: false)
    elsif params[:allow]
      @application.update(is_confirmed: true)
      update_role
    end
    @application.update(is_checked: true)
  end

  def update_role
    user = User.find(@application.user_id)
    user.update(role: :checked)
  end
end
