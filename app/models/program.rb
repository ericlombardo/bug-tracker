class Program < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  

  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs
  has_many :tasks
  has_one_attached :logo

  #validations
  validates :name, :status, :description, :opened_date, presence: true

  def bug_count(status)
    self.bugs.where("status == ?", status).count 
  end
end
