class IdeasController < ApplicationController
  before_action :authenticate

  def index
    @ideas = Idea.where(published: true).where.not(user_id: current_user.id)
  end

  def show
    @warning = false
    @version_warning = false
    @is_old_version = false
    @is_current_users = false
    @idea = Idea.find_by_id(params[:id])

    if !@idea
      @warning = true
      return
    end

    @is_current_users = @idea.user_id == current_user.id

    if (!@is_current_users && !@idea.published)
      @warning = true
      return
    end

    if params[:version].present?
      @version = Version.where(idea: @idea, number: params[:version])

      if @version.empty?
        @version_warning = true
        @version = nil
      else
        @version = @version.take
      end
    end

    @versions = Version.where(idea_id: @idea.id).order(number: :asc)
    @version_count = @versions.count
    @version ||= @versions.last
    @is_old_version = @version.number != @version_count
    @upvotes = Upvote.where(version: @idea.versions).count
    @has_already_voted = Upvote.where(version: @version, user: current_user).count > 0
    @past_vote = Upvote.where(user: current_user, version: @idea.versions).where.not(version: @version).take

    if @has_already_voted
      @vote = Upvote.where(version: @version, user: current_user).take
    end
  end

  def edit
    @warning = false
    is_current_users = nil;
    @idea = Idea.find_by_id(params[:id])

    if @idea
      # idea exists, confirm it belongs to the current user
      is_current_users = @idea.user_id == current_user.id

      if is_current_users
        @version_content = Version.where(idea_id: @idea.id).last
      else
        # not your idea, son!
        print('not your idea, son!\n')
        print('user ', current_user.id, ' tried to see idea ', @idea.id, ' which belongs to ', @idea.user_id)
        redirect_to dashboard_url
      end
    else
      @warning = true
    end
  end

  def new
    # TODO how to make two submit buttons? save and publish, just save
    # TODO how to disable a checkbox tag?
    @too_many_published = Idea.where(user_id: current_user.id, published: true).count == 5
  end

  # POST
  def create
    idea = Idea.new(
      name: params[:name],
      user_id: current_user.id
    )

    if params[:published]
      idea.published = true
    else
      idea.published = false
    end

    if idea.save
      version = Version.new(idea_id: idea.id, goal: params[:goal], content: params[:content], number: 1)

      if version.save
        redirect_to idea
      else
      end
    else
      # TODO show dem errors
    end
  end

  # PATCH/PUT
  def update
    idea = Idea.find_by_id(params[:id])
    last_version = Version.where(idea_id: idea).last

    version = Version.new(
      idea_id: idea.id,
      goal: params[:goal],
      content: params[:content],
      number: last_version.number + 1
    )

    if version.save
      redirect_to idea
    else
      # TODO show the errors
    end
  end

  def publish
    idea = Idea.find_by_id(params[:idea_id])
    idea.published = !idea.published

    if idea.save
      redirect_to idea
    else
      # TODO show errors
    end
  end

  # DELETE
  def destroy
    idea = Idea.find(params[:id])
    if idea.destroy
      redirect_to dashboard_url
    else
      # TODO show errors
    end
  end

  private
  def authenticate
    redirect_to root_url if current_user.nil?
  end
end
