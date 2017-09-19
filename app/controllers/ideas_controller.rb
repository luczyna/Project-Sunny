class IdeasController < ApplicationController
  before_action :authenticate

  def index
    @ideas = Idea.where(published: true)
  end

  def show
    @warning = false
    @is_current_users = false
    @idea = Idea.find_by_id(params[:id])

    if @idea
      @is_current_users = @idea.user_id == current_user.id
      if (@idea.published || (!@idea.published && @is_current_users))
        @version = Version.where(idea_id: @idea.id).last
      else
        @warning = true
      end
    else
      @warning = true
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
  end

  # DELETE
  def destroy
  end

  private
  def authenticate
    redirect_to root_url if current_user.nil?
  end
end
