class BugsController < ApplicationController
  def show
    @bug = Bug.find_by(id: params[:id])
  end
end
