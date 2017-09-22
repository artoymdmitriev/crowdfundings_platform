class NewsItemsController < ApplicationController
  include Mailable
  include NewsItemsHelper
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :my_news]
  before_action :set_project, except: [:index, :show, :edit, :update, :my_news]
  before_action :load_news_item, only: [:show, :edit, :destroy, :update]
  before_action :check_for_rights, only: [:create, :update, :edit, :destroy]

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

  def my_news
    projects = []
    current_user.subscriptions.each { |s| projects << s.project }
    @news_items = []
    projects.each { |p| p.news_items.each {|ni| puts ni; @news_items << ni} }
    @news_items.sort! {|x,y| y.id <=> x.id }
  end

  # TODO add translation
  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def load_news_item
    @news_item ||= NewsItem.find(params[:id])
  end

  def news_item_params
    params.require(:news_item).permit(:text)
  end
end