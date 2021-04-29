class ProgramsController < ApplicationController

  def index
    if params[:user_id] && params[:user_id].to_i == current_user.id
      @user = User.find_by(id: params[:user_id])
      @programs = @user.programs
    elsif params[:user_id]
      redirect_to user_programs_path(current_user), alert: "These are your programs"
    else
      @programs = Program.all
    end
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def new
    @program = Program.new
    @devs = User.get_devs # collect all users where role == "dev"
    @prj_managers = User.get_prj_managers # collect all users where role == "prj_manager"
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to @program
    else                  
      # check routing when validations in place
      # make sure field with errors div and alerts show
      redirect_to new_program_path  
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :description, :status, user_ids: [])
  end
end
