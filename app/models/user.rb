class User < ApplicationRecord
  has_secure_password

  # associations
  has_many :programs_users
  has_many :programs, through: :programs_users
  has_many :bugs, through: :programs

  # Scope method to sort user names alphabetically
  scope :alpha_users, -> { order(:name) }
end
