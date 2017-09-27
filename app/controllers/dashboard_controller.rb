class DashboardController < ApplicationController
  before_action :authenticate

  def index
    # get users ideas
    # separate by published status
    @published_ideas = Idea.where(user_id: current_user.id, published: true)
    @other_ideas = Idea.where(user_id: current_user.id, published: false)
    @votes = get_users_current_votes(current_user)
  end

  private
  def authenticate
    redirect_to root_url if current_user.nil?
  end

  # TODO how to test this
  def get_users_current_votes(user)
    applicable_ideas = Idea.all.published.where.not(user: user)
    applicable_versions = Version.where(idea: applicable_ideas)
    votes = Upvote.where(user: user, version: applicable_versions.ids)
    return votes
  end
end
