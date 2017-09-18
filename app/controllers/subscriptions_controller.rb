class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def new
    puts "///////////////////////////////////// HEllo from new method"
    @subscription = Subscription.new
  end

  def create
    puts "///////////////////////////////////// HEllo from create method"
    @subscription = Subscription.create(subscription_params)
    @subscription.update(user_id: current_user.id)
  end

  def destroy
    @subscription.destroy
  end

  private
  def subscription_params
    params.permit(:project_id)
  end
end