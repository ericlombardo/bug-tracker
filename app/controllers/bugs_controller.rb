class BugsController < ApplicationController
  def new
    @bug = Bug.new
  end

  def show
    @bug = Bug.find_by(id: params[:id])
  end


end
