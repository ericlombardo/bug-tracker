class ProgramsController < ApplicationController
  def show
    @program = Program.find_by(id: params[:id])
  end
end
