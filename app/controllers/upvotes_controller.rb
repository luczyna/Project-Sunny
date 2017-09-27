class UpvotesController < ApplicationController
  def create
    version = Version.find(params[:version])
    idea = version.idea

    vote = Upvote.new do |u|
      u.user_id = current_user.id
      u.version_id = params[:version]
    end

    if vote.save
      redirect_to idea
    else
      # TODO show errors
    end
  end

  def destroy
    idea = Idea.find_by_id(params[:idea])
    vote = Upvote.find_by_id(params[:vote])

    if vote.destroy
      redirect_to idea
    else
      # TODO show errors
    end
  end
end
