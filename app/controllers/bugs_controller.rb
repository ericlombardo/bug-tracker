class BugsController < ApplicationController
  before_action :authenticate # confirms user is logged in
  
  def index
    if params[:program_id] # if 'program bugs'
      assign_program_and_bugs #apab(.) Sets @program and @bugs
    elsif params[:user_id]  # elsif 'user bugs'
      assign_and_redirect_user #aaru(.) Sets @user and @bugs or redirects to correct user index
    end
  end

  def new
    if params[:program_id] && @program = Program.find_by(id: params[:program_id])
      @bug = @program.bugs.build(status: "pending")
    else
      redirect_to programs_path, alert: "You must select a program before reporting a bug"
    end
  end

  def create
    @bug = Bug.new(bug_params)  # create new bug instance
    @bug.save ? (redirect_to [@bug.program, @bug]) : (render :new)  
  end

  def edit
    @bug = Bug.find_by(id: params[:id])
  end

  def update 
    @bug = Bug.find_by(id: params[:id])
    @bug.update(bug_params) ? (redirect_to program_bug_path(@bug)) : (render :edit)
  end
  
  def show
    @bug = Bug.find_by(id: params[:id])
  end

  private ################################################################

  def bug_params
    params.require(:bug).permit(:category, :priority, :status, :overview, :description, :created, :notes, :next_steps, :update_for_client, :program_id)
  end

  def assign_program_and_bugs # assign @bugs and @program if program found, redirect if not
    if @program = Program.find_by(id: params[:program_id])
      @bugs = @program.bugs
    else
      redirect_to programs_path, alert: "Info for the program not found"
    end
  end

  def assign_user_and_bugs
    @user = User.find_by(id: params[:user_id])
    @bugs = @user.bugs
  end

  def assign_and_redirect_user # sets @users and @bugs if correct user, redirects if not
    if params[:user_id].to_i == current_user.id #
      assign_user_and_bugs #auab(.) sets @user and @bugs
    else
      redirect_to user_bugs_path(current_user), alert: "These are your bugs"
    end
  end
end
