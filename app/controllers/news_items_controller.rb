class NewsItemsController < ApplicationController
  before_action :set_project
  before_action :load_news_item, only: [:show, :edit, :destroy, :update]
  before_action :validate_user, only: [:new, :create, :edit, :destroy]

  def index
    @news_items = @project.news_items
  end

  def new
    @news_item = @project.news_items.new
  end

  def create
    @news_item = @project.news_items.create(news_item_params)
    @news_item.update(user_id: current_user.id)
    redirect_to project_path(@project)
  end

  def show
    @commentable = @news_item
  end

  def edit
  end

  def destroy
    @news_item.destroy
    flash[:success] = 'Project deleted'
    redirect_to root_path
  end

  private
  def set_project
    begin
      @project = current_user.projects.find(params[:project_id])
    rescue
      flash[:error] = 'You are not allowed to add news for this project'
      redirect_to root_path
    end
  end

  def load_news_item
    @news_item ||= NewsItem.find(params[:id])
  end

  def news_item_params
    params.require(:news_item).permit(:text, :project_id)
  end
end
