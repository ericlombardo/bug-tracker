class ProgramsController < ApplicationController
  before_action :authenticate # makes sure user is logged in
  
  def index
    nested_user? ? (show_user_programs) : (@programs = Program.all) #nu?, sup(.)
  end

  def show # write helper methods in model like get_active_count that return instance variablle
    @program = Program.find_by(id: params[:id])
    @active_bug_count = @program.bug_count("active")
    @pend_bug_count = @program.bug_count("pending")
    @closed_bug_count = @program.bug_count("closed")
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

  def show_user_programs  # assign user and programs based on if nested hash or not
    if nested_user? == current_user.id  #nu?(.)
      @user = User.find_by(id: params[:user_id])
      @programs = @user.programs
    else
      redirect_to user_programs_path(current_user), alert: "These are your programs"
    end
  end

  def nested_user
    params[:user_id].to_i
  end
end
