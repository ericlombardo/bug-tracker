class SessionsController < ApplicationController
  def welcome
  end

  def client_new # show new login form
  end

  def client_create
    user = User.find_by(email: params[:email])  # find the user in database using email
    if user && user.authenticate(params[:password]) # make sure user exists and password matches
      session[:user_id] = user.id # assign user id to session hash
      redirect_to programs_path # redirect desired view
    else  # if user not found or wrong password
      flash.alert = "Invalid Username or Password"  # put message in flash hash
      redirect_to client_login_path  # redirect to login view to show alert
    end
  end

  def employee_new
  end
  def employee_create
    user = User.find_by(email: params[:email])  # find the user in database using email
    if user && user.authenticate(params[:password]) # make sure user exists and password matches
      session[:user_id] = user.id # assign user id to session hash
      redirect_to user # redirect desired view
    else  # if user not found or wrong password
      flash.alert = "Invalid Username or Password"  # put message in flash hash
      redirect_to client_login_path  # redirect to login view to show alert
    end
  end

  def destroy # check for right user, redirect of not
    session.delete :user_id # removes user_id from session hash
    redirect_to root_path  # redirects to login page
  end
 
  private

  def session_params  # ensures that only user with email and password attributes are accepted
    params.require(:user).permit(:email, :password)
  end 
end
