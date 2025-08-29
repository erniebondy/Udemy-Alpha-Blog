class SessionsController < ApplicationController

  def new
    #@session = Session.new
  end

  def create
    username = params[:session][:username].downcase
    password = params[:session][:password]

    user = User.find_by(username: username)

    if user && user.authenticate(password)
      ## This sets the 'session' instance variable so that the user remains logged in
      ## See Rails guides for more info about Session
      session[:user_id] = user.id
      flash[:notice] = "Welcome back #{username}"
      redirect_to user
    else
      ## 'flash.now' displays the message immediately
      ## Without the '.now' the message will display after 1 http 'cycle'
      flash.now[:alert] = "There was something wrong with you login details!"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out!"
    redirect_to root_path
  end

end