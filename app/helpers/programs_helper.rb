module ProgramsHelper

  def opened_date
    @program.opened_date.strftime("%A %d, %Y")
  end

  def closed_date
    @program.closed_date.strftime("%A %d, %Y") if @program.closed_date
  end
end
