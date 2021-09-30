class ProgramsController < ApplicationController
  # before_action :authenticate # makes sure user is logged in
  
  def index
    nested_user? ? (show_user_programs) : (@programs = Program.supported) #nu?, sup(.)
  end

  def show 
    @program = Program.find_by(id: params[:id])
    @bugs = get_all_bugs(@program) #gab(application_controller) 
    #=> {active: [instances], pending: [instances], closed: [instances]}
    
    # goes directly to program bugs if client 
    redirect_to program_bugs_url(@program) if current_user.role === "Client"


  end

  def new
    @program = Program.new
    get_employees #ge(.) sets @devs and @prj_managers from all users 
  end

  def create # show errors if redirect
    @program = Program.new(program_params)
    @program.save ? (redirect_to @program) : (get_employees ;render :new) #ge(.) sets @devs and @prj_managers from all users 
  end

  def edit
    if @program = Program.find_by(id: params[:id])
      get_employees #ge(.) sets @devs and @prj_managers from all users
    else
      redirect_to programs_path, alert: "Not an updatable program"
    end
  end
  
  
  def update
    @program = Program.find_by(id: params[:id])
    if @program.update(program_params)
      remove_employees if no_employees_assigned #ue, nea(.) 
      redirect_to @program 
    else
      get_employees #ge(.) sets @devs and @prj_managers from all users
      render :edit
    end
  end
  
  private ##################################################################

  def program_params
    params.require(:program).permit(:name, :description, :status, :opened_date, :closed_date, :logo, user_ids: [])
  end

  def show_user_programs  # assign @user and @programs based on if nested hash or not
    if nested_user?.to_i == current_user.id  #nu?(.)
      @user = User.find_by(id: params[:user_id])
      @programs = @user.programs.supported
    else
      redirect_to user_programs_path(current_user), alert: "These are your programs"
    end
  end

  def nested_user? # check if user id present in params
    params[:user_id]
  end

  def get_employees
    @devs = User.get_devs # collect all users where role == "dev"
    @prj_managers = User.get_prj_managers # collect all users where role == "prj_manager"
    @admins = User.get_admins # collect all users where role == "admin"
  end

  def no_employees_assigned # check if no values for employee in params
    params[:program][:user_ids].nil?
  end

  def remove_employees # remove any current employee associations for that project
    @program.users = []
  end
end
