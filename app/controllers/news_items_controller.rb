class NewsItemsController < ApplicationController
  include Mailable
  before_action :set_project, except: [:index, :show, :edit, :update]
  before_action :load_news_item, only: [:show, :edit, :destroy, :update]

  def index
    @news_items = @project.news_items
  end

  def new
    @news_item = @project.news_items.new
  end

  def create
    @news_item = @project.news_items.create(news_item_params)
    @news_item.update(user_id: current_user.id)
    mail(@news_item)
    redirect_to project_path(@project)
  end

  def show
    @commentable = @news_item
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def update
    @news_item = NewsItem.find(params[:id])
    @news_item.update_attributes(news_item_params)
  end

  # TODO add translation
  def destroy
    @news_item.destroy
    flash[:success] = 'News Item was deleted'
    redirect_to request.refferer || root_path
  end

  # TODO add translation
  private
  def set_project
    begin
      @project = current_user.projects.find(params[:project_id])
    rescue
      flash[:error] = 'You are not allowed to add news for this project'
      redirect_to request.referrer || root_path
    end
  end

  def load_news_item
    @news_item ||= NewsItem.find(params[:id])
  end

  def news_item_params
    params.require(:news_item).permit(:text)
  end
end