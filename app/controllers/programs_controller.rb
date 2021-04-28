class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find_by(id: params[:id])
  end
end
