class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def new
    @program = Program.new
    @devs = Program.get_devs # collect all users where role == "dev"
    @prj_manager = Program.get_prj_managers # collect all users where role == "prj_manager"
  end
end
