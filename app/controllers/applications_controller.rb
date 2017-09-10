class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    check_admin
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

  private
  def check_admin
    unless current_user.admin?
      redirect_back fallback_location: root_path
    end
  end
end
