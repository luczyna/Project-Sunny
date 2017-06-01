class DashboardController < ApplicationController
  before_action :authenticate
  
  def index
    # get users ideas
    # separate by published status
    # @published_ideas = Ideas.where(user: current_user).only(published: true)
    # @other_ideas = Ideas.where(user: current_user).only(published: false)
  end

  private
  def authenticate
    redirect_to root_url if current_user.nil?
  end
end
