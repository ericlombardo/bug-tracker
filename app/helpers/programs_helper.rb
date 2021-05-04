module ProgramsHelper

  def check?(id)
    @program.users.any? {|u| u.id == id}
  end

  def closed?
    @program.closed_date.instance_of?(Date)
  end
  def opened_date
    @program.opened_date.strftime("%A %d, %Y") if @program.opened_date
  end

  def closed_date
    @program.closed_date.strftime("%A %d, %Y") if @program.closed_date
  end
end
