class Program < ApplicationRecord
  # associations
  has_many :programs_users
  has_many :users, through: :programs_users
  has_many :bugs
end
