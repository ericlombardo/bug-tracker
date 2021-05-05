module ApplicationHelper

  def admin?
    current_user.role == "admin"
  end
  
  def current_user  # return user instance if logged in and present
    user ||= User.find_by(id: session[:user_id])
  end

  def logged_in? # returns user_id if present => redirects to root if not
    id ||= session[:user_id] ? (session[:user_id]) : (redirect_to root_path)
  end
end
