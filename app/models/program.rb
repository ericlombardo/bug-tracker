class Program < ApplicationRecord
  include ScopeMethods  # pulls in scope methods from app/models/concerns
  
  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs
  has_many :tasks
  has_one_attached :logo

  #validations
  validates :name, :status, :description, presence: true

  # scope methods
  def self.supported
    self.where(closed_date: nil)
  end

  #instance methods
  def get_all_bugs
    bugs = {
      active: self.bugs.where("status == ?", "active"),
      pending: self.bugs.where("status == ?", "pending"),
      closed: self.bugs.where("status == ?", "closed")
    }
  end
end
