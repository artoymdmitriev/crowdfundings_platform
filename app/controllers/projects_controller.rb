class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @projects = Project.all
  end

  def my_projects
    @users_projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    params.permit!
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    if @project.save
      redirect_to root_path
    else
      puts "YOU ARE STUPID"
    end
  end
end
