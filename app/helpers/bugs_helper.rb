module BugsHelper

  def choose_title(program, user)
    program.present? ? (program.name) : (user.name)
  end
end
  