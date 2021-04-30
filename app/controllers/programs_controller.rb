class ProgramsController < ApplicationController

  def index
    if params[:user_id] 
      if params[:user_id].to_i == current_user.id
        @user = User.find_by(id: params[:user_id])
        @programs = @user.programs
      else
        redirect_to user_programs_path(current_user), alert: "These are your programs"
      end
    else
      @programs = Program.all
    end
  end

  def show # how can I remove clunkiness??
    @program = Program.find_by(id: params[:id])
    @open_bug_count = @program.bug_count("open")
    @pend_bug_count = @program.bug_count("pending")
    @closed_bug_count = @program.bug_count("open")
    @devs = @program.users.where(role: "dev")
    @prj_managers = @program.users.where(role: "prj_manager")
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
