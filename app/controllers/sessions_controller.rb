class SessionsController < ApplicationController
  before_action :authenticate, only: [:destroy]
  before_action :already_logged_in, only: [:welcome, :client_new, :employee_new, :omniauth ]

  # welcome | client_new | employee_new 
  # actions above have nothing in them, don't need to be in controller

  def create
    @user = User.find_by(email: params[:email])  # find the user in database using email
    authentic_user? ? (log_user_in) : (redirect_invalid_user) # make sure user exists and password matches 
  end
  


  def omniauth
    user = User.find_or_create_by(email: auth_hash[:info][:email]) do |u|
      assign_user_attributes(u)
    end
    user.password = SecureRandom.hex(15)
    if user.save
      session[:user_id] = user.id
      user.role == "client" ? (redirect_to programs_path) : (redirect_to user)
    else
      redirect_to root_path
    end
  end
  
  def destroy
    session.delete :user_id # removes user_id from session hash
    redirect_to root_path  # redirects to login page
  end
  
  private # where do these go? thought it would be controller, but sessions doesn't have controller
  
  def session_params  # ensures that only user with email and password attributes are accepted
    params.require(:user).permit(:email, :password)
  end 
  
  def auth_hash
    request.env["omniauth.auth"]
  end
  
  def assign_user_attributes(user)
    user.uid = auth_hash[:uid]
    user.provider = auth_hash[:provider]
    user.name = auth_hash[:info][:name]
    user.role = find_role # assign role based on provider => assign_role method => git = "dev" google = "client"
  end

  def find_role
    if auth_hash[:provider] == "github"
      "dev"
    elsif auth_hash[:provider] == "google_oauth2" 
      "client" 
    end
  end
end

# found omniauth walkthrough to help troubleshoot connection issues in routes
# https://www.youtube.com/watch?v=WWcbcNlsK7U