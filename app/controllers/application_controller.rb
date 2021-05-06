class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ProgramsHelper

  def authenticate
    redirect_to root_path if !logged_in?
  end

  def already_logged_in
    redirect_to current_user if current_user
  end

  # helper methods for login in both session controller and user controller
  def authentic_user?
    @user && @user.authenticate(params[:password])
  end

  def log_user_in
    session[:user_id] = @user.id # assign user id to session hash
    redirect_logged_in # redirect desired view
  end

  def redirect_logged_in 
    @user.role == "client" ? (redirect_to programs_path) : (redirect_to @user)
  end

  def redirect_invalid_user
    flash.alert = "Invalid Username or Password. Please try again"  # put message in flash hash
    redirect_to root_path  
  end

  def render_new_user_view
    @user.role == "client" ? (render :client_new) : (render :employee_new)
  end
end
