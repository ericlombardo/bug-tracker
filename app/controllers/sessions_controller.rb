class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to programs_path
    else
      flash.alert = "No user found. Try again or Signup"
      redirect_to login_path
    end
  end

  def destroy # check for right user, redirect of not
    session.delete :user_id
    redirect_to login_path
  end
 
  private

  def session_params
    params.require(:user).permit(:email, :password)
  end 
end
