class DashboardController < ApplicationController
  before_action :authenticate
  
  def index
    # get users ideas
    # separate by published status
    @published_ideas = Idea.where(user_id: current_user.id, published: true)
    @other_ideas = Idea.where(user_id: current_user.id, published: false)
  end

  private
  def authenticate
    redirect_to root_url if current_user.nil?
  end
end
