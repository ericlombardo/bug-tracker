class UsersController < ApplicationController
  before_action :authenticate, only: [:index, :show, :edit, :search]
  before_action :already_logged_in, only: [:client_new, :employee_new]
  before_action :check_user, only: [:edit, :show]
  
  def index # must be admin to view
    @users = User.all
  end
  
  def client_new
    @user = User.new(role: "client")
  end

  def create
    @user = User.new(user_params)
    @user.save ? (log_user_in) : (render_new_user_view)
  end

  def employee_new
    @user = User.new(role: "dev")
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params) && current_user.role == "admin"
      redirect_to users_path
    elsif @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def search
    @filter = params[:query]
    @users = User.where("name LIKE ?", "%#{params[:query]}%")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def check_user
    unless admin? || params[:id].to_i == current_user.id
      redirect_to current_user, alert: "This is your account"
    end
  end
end
