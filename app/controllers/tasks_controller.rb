class TasksController < ApplicationController
  # before_action :correct_user?

  def index
    @tasks = User.find_by(id: params[:user_id]).tasks 
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
    if params[:user_id]
      @task = Task.find_by(id: params[:id])
    end
  end
  def destroy
  
  end

  private

  def correct_user?
    redirect_to current_user, alert: "You can only create tasks for yourself" unless params[:user_id].to_i == current_user.id
  end
end
