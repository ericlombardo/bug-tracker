class Program < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  
  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs

end
