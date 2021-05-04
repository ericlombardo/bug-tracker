class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ProgramsHelper

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def already_logged_in
    if current_user
      redirect_to current_user
    end
  end
end
