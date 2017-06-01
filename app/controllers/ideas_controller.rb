class IdeasController < ApplicationController
  before_action :authenticate

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  # POST
  def create
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
