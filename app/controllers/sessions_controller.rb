class SessionsController < ApplicationController
  before_action :authenticate, only: [:destroy]
  before_action :already_logged_in, only: [:welcome, :client_new, :employee_new, :omniauth ]

  # welcome | client_new | employee_new 
  # actions above have nothing in them, don't need to be in controller

  def create
    @user = User.find_by(email: params[:email])  # find the user in database using email
    authentic_user? ? (log_user_in) : (redirect_invalid_user) # #au?, lui, riu(appcontroller)
  end
  
  def omniauth
    @user = User.find_or_create_by(email: auth_hash[:info][:email]) do |u|
      assign_user_attributes(u) #aua(.)
    end
    @user.id ? (log_user_in) : (redirect_to root_path)  #lui(appcontroller)
  end
  
  def destroy
    session.delete :user_id # removes user_id from session hash
    redirect_to root_path  # redirects to login page
  end
  
  private ##################################################################
  
  def session_params  # strong params for client/employee login
    params.require(:user).permit(:email, :password)
  end 
  
  def auth_hash # oauth response
    request.env["omniauth.auth"]
  end
  
  def assign_user_attributes(user) # assigns oauth user attributes
    user.uid = auth_hash[:uid]
    user.provider = auth_hash[:provider]
    user.name = auth_hash[:info][:name]
    user.role = oauth_find_role #ofr(.)
    user.password = SecureRandom.hex(15)
  end

  def oauth_find_role
    if auth_hash[:provider] == "github"
      "dev"
    elsif auth_hash[:provider] == "google_oauth2" 
      "client" 
    end
  end
end

# found omniauth walkthrough to help troubleshoot connection issues in routes
# https://www.youtube.com/watch?v=WWcbcNlsK7U