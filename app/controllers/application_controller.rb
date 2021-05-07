class ApplicationController < ActionController::Base
  include ApplicationHelper # allows access to each helper file listed
  include ProgramsHelper

  def authenticate  # before action used throughout controllers to make sure user is logged in
    redirect_to root_path if !logged_in? # #li?(apphelper.rb)
  end

  def already_logged_in # before action used to prevent user seeing login/signup views if already logged in
    redirect_to current_user if current_user # #cu(apphelper.rb)
  end

  # helper methods for login/signup in session and user controllers
  def authentic_user? # makes sure user exists and password matches hashed password
    @user && @user.authenticate(params[:password])
  end

  def log_user_in
    session[:user_id] = @user.id # assign user id to session hash
    redirect_logged_in # #rli(.)
  end

  def redirect_logged_in # redirect to programs view or show view for user
    @user.role == "Client" ? (redirect_to programs_path) : (redirect_to @user)
  end

  def redirect_invalid_user # send invalid user to root path with message
    flash.alert = "Invalid Username or Password. Please try again"
    redirect_to root_path  
  end
end
