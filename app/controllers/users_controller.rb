class UsersController < ApplicationController

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
