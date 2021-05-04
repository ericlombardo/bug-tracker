class ProgramsController < ApplicationController
  before_action :authenticate
  
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
    @active_bug_count = @program.bug_count("active")
    @pend_bug_count = @program.bug_count("pending")
    @closed_bug_count = @program.bug_count("closed")
    @devs = @program.users.where(role: "dev") # create user scope method, just call method in view then @program.users.devs
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

  def edit
    if @program = Program.find_by(id: params[:id])
      @devs = User.get_devs # collect all users where role == "dev"
      @prj_managers = User.get_prj_managers # collect all users where role == "prj_manager"
    end
  end

  def update
    @program = Program.find_by(id: params[:id])
    if @program.update(program_params)
      redirect_to @program 
    else
      render :edit # show errors on @program object
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :description, :status, :opened_date, :closed_date, :logo, user_ids: [])
  end
end
