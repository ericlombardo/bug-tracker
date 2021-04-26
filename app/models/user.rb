class User < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  
  has_secure_password

  # associations
  has_many :programs_users
  has_many :programs, through: :programs_users
  has_many :bugs, through: :programs

end
