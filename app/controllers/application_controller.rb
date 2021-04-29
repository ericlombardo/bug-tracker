class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?



  private

  def current_user  # return user instance if logged in and present
    User.find_by(id: logged_in?)
  end

  def logged_in? # returns user_id if present => redirects to root if not
    session[:user_id] ? (session[:user_id]) : (redirect_to root_path)
  end
end
