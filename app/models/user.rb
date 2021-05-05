class User < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  
  has_secure_password

  # associations
  has_many :programs_users
  has_many :programs, through: :programs_users
  has_many :bugs, through: :programs
  has_many :tasks

  # validations
  validates :name, :email, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :email, uniqueness: {message: "must be unique to continue"}, format: { with: /.{1,}@[^.]{1,}/, message: "is not valid"}, unless: :no_email
  
  # scope methods
  scope :get_devs, -> {where(role: "dev")} 
  scope :get_prj_managers, -> {where(role: "prj_manager")} 

  private 

  def no_email
    !email
  end


end
