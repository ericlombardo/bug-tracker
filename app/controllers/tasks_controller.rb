class TasksController < ApplicationController
  before_action :correct_user?

  def index
    binding.pry
  end
  def new
  
  end
  def create
  
  end
  def edit
  
  end
  def update
  
  end
  def show
  
  end
  def destroy
  
  end

  private

  def correct_user?
    binding.pry
    redirect_to current_user, alert: "You can only create tasks for yourself" unless
    params[:user_id].to_i == current_user.id
  end
end
