class UsersController < ApplicationController

  def index # must be admin to view
    @users = User.all
  end
  def client_new
    @user = User.new(role: "client")
  end

  def client_create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to programs_path
    else
      render :client_new
    end
  end

  def employee_new
    @user = User.new(role: "dev")
  end

  def employee_create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user
    else
      render :employee_new
    end
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
    query = "%#{params[:query]}%"
    @filter = params[:query]
    @users = User.where("name LIKE ?", query)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
