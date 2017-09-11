class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :my_projects, :show]

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
    save_project
  end

  def show
    @project = Project.find(params[:id])
    @money_earned = count_money
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
  def check_user
    unless current_user.application.is_confirmed
      flash[:error] = 'You are not a confirmed user'
      redirect_to '/applications/new'
    end
  end

  def save_project
    if @project.save!
      redirect_to root_path
    else
      flash[:error] = 'Error saving new project'
    end
  end
end
