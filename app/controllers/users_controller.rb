class UsersController < ApplicationController

  def client_new
    @user = User.new(role: "client")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to programs_path
    else
      render :new
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
