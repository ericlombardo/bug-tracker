class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ProgramsHelper

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end
end
