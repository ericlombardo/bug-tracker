class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ProgramsHelper

  def authenticate
    redirect_to root_path if !logged_in?
  end

  def already_logged_in
    redirect_to current_user if current_user
  end
end
