class BugsController < ApplicationController
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
    # create new bug instance
    @bug = Bug.new(bug_params)
    # make sure it is valid/saves
    if @bug.save
      binding.pry
      redirect_to program_bug_path  
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
