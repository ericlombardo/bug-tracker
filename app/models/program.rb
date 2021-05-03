class Program < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  
  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs
  has_many :tasks, through: :bugs

  def bug_count(status)
    self.bugs.where("status == ?", status).count 
  end
end
