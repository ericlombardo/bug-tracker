class Program < ApplicationRecord
  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs

  # Scope method to sort program names alphabetically
  scope :alpha_programs, -> { order(:name) }
end
