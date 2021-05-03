class TasksController < ApplicationController
  # before_action :correct_user?

  def index
    @tasks = User.find_by(id: params[:user_id]).tasks 
  end

  def new
    user = User.find_by(id: params[:user_id])
    @task = user.tasks.build
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_task_path(current_user, @task)
    else
      render :new
    end
  end
  def edit
    @task = Task.find_by(id: params[:id])
  end
  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to user_task_path(@task.user, @task)
    else
      render :edit
    end
  end
  def show
    if params[:user_id]
      @task = Task.find_by(id: params[:id])
    end
  end
  def destroy
    if current_user.id == params[:user_id].to_i
      task = Task.find_by(id: params[:id])
      task.destroy
      redirect_to user_tasks_path(current_user)
    else
      redirect_to user_tasks_path(current_user), alert: "These are your tasks"
    end
  end

  private

  def correct_user?
    redirect_to current_user, alert: "You can only create tasks for yourself" unless params[:user_id].to_i == current_user.id
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :content, :urgency, :user_id, :program_id)
  end
end
