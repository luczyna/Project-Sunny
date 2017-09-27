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

  def update
    # remove the user's vote (provided) from the previous version
    # add the vote to the current version (provided)
    current_version = Version.find(params[:version])
    idea = current_version.idea

    # TODO think on how to direct errors?
    Upvote.find(params[:vote]).destroy
    vote = Upvote.new(user_id: current_user.id, version_id: current_version.id)

    if vote.save
      redirect_to idea
    else
      # TODO more error handling
    end
  end
end
