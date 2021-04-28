class ProgramsController < ApplicationController

  def index
    @programs = Program.all
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
    binding.pry
  end
end
