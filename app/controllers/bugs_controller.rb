class BugsController < ApplicationController
  def index
    if params[:program_id]
      @prog = Program.find_by(id: params[:program_id])
      @bugs = @prog.bugs
    elsif params[:user_id] 
      if params[:user_id].to_i == current_user.id
        @user = User.find_by(id: params[:user_id])
        @programs = @user.programs
      else
        redirect_to user_bugs_path(current_user), info: "These are your bugs"
      end
    else
      redirect_to programs_path, info: "Please select a program in order to view bugs"
    end
  end

  def new
    if params[:program_id]
      @prog = Program.find_by(id: params[:program_id])
      @bug = @prog.bugs.build
    else
      # message about selecting a program before reporting a bug
      redirect_to programs_path
    end
  end

  def create 
    @bug = Bug.new(bug_params)  # create new bug instance
    if @bug.save  # make sure it is valid/saves
      redirect_to [@bug.program, @bug]  
    else
      render :new
    end
  end
  
  def show
    @bug = Bug.find_by(id: params[:id])
  end

  private

  def bug_params
    params.require(:bug).permit(:category, :priority, :status, :overview, :description, :created, :notes, :next_steps, :update_for_client, :program_id)
  end
end
