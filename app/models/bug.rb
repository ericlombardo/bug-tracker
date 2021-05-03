class Bug < ApplicationRecord
  # associations
  belongs_to :program
  has_many :users, through: :program 
end
