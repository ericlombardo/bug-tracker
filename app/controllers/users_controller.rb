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

  def employee_new
    @user = User.new(role: "dev")
  end
  def create
    @user = User.new(user_params)
    @user.save ? (log_user_in) : (render_new_user_view)
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit # only show role update if admin
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params) ? (redirect_updated_user) : (render :edit)
  end
  
  def search
    @filter = params[:query]
    @users = User.where("name LIKE ?", "%#{params[:query]}%")
  end

  private

  def user_params # strong params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def check_user # before action to check if proper user or admin
    unless admin? || params[:id].to_i == current_user.id
      redirect_to current_user, alert: "This is your account"
    end
  end

  def redirect_updated_user # redirect user based on role after update action
    current_user.role == "admin" ? (redirect_to users_path) : (redirect_to @user)
  end

  def render_new_user_view # decides which view to render based user role
    @user.role == "client" ? (render :client_new) : (render :employee_new)
  end
end
