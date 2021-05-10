module ProgramsHelper

  def check?(id) # sets checked to true if previously selected in program new/edit form
    @program.users.any? {|u| u.id == id}
  end

  def closed? # checks if program support checkbox needs checked in new/edit form
    @program.closed_date.instance_of?(Date)
  end
  
  def opened_date #formats program opened_date
    @program.opened_date.strftime("%B %d, %Y") if @program.opened_date
  end

  def closed_date #formats program closed_date
    @program.closed_date.strftime("%B %d, %Y") if @program.closed_date
  end
end
