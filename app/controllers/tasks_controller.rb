class TasksController < ApplicationController
  before_action :authenticate, :check_user

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
    Task.find_by(id: params[:id]).destroy
    redirect_to user_tasks_path(current_user)
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :content, :urgency, :user_id, :program_id)
  end

  def check_user
    if params[:user_id].to_i != current_user.id
      redirect_to user_tasks_path(current_user), alert: "These are your tasks"
    end
  end
end
