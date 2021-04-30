module ProgramsHelper

  def check?(id)
    @program.users.any? {|u| u.id == id}
  end
  def opened_date
    @program.opened_date.strftime("%A %d, %Y")
  end

  def closed_date
    @program.closed_date.strftime("%A %d, %Y") if @program.closed_date
  end
end
