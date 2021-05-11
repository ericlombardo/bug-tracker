module ApplicationHelper

  def admin?
    current_user.role == "Admin"
  end
  
  def prj_manager?
    current_user.role == "Project Manager"
  end
  
  def current_user  # return user instance if logged in and present
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in? # returns user_id if present => redirects to root if not
    @id ||= session[:user_id] ? (session[:user_id]) : (redirect_to root_path)
  end

  def display_navbar
    case current_user.role
    when "Client"
      render "layouts/client_nav"
    when "Developer"
      render "layouts/employee_nav"
    when "Project Manager"
      render "layouts/employee_nav"
    when "Admin"
      render "layouts/admin_nav"
    end
  end
end
