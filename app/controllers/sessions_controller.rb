class SessionsController < ApplicationController
  # TODO remove these???, we don't need views for this
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in.'
    else
      flash.now.alert = 'Invalid credentials'
      # TODO this will replace /login with /sessions, not intended
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out.'
  end
end
