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

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end 
end

# found article on dev.to on how to show message for displaying (create actions)
end