class ProjectsController < ApplicationController
  include ProjectsHelper
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show, :my_projects]
  before_action :check_configuration
  before_action :load_project, only: [:show, :edit, :destroy]
  before_action :check_for_edit_rights, only: [:edit, :destroy]

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
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    uploaded_io = params[:project][:pic_link]
    upload_image uploaded_io.path unless uploaded_io.nil?
    save_project
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = 'Project deleted'
    redirect_to root_path
  end

  private
  def load_project
    @project ||= Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :fundings_deadline, :description, :pic_link, :goal, :min_payment, :max_payment, :tag_list)
  end

  def check_user
    unless !current_user.application.nil? && current_user.application.is_confirmed
      flash[:error] = 'You are not a confirmed user'
      redirect_to '/applications/new'
    end
  end

  def check_for_edit_rights
    unless check_for_rights
      flash[:error] = 'You are not allowed to edit another\'s posts'
      redirect_to '/projects/'
    end
  end

  def save_project
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def check_configuration
    render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end

  def local_image_path(name)
    Rails.root.join('uploads', name).to_s
  end

  def upload_image file
    upload = Cloudinary::Uploader.upload file,
                                          :tags => "basic_sample"
    @project.pic_link = upload["url"]
  end
end
