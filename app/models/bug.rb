class Bug < ApplicationRecord
  # associations
  belongs_to :program, optional: true
  has_many :users, through: :program 

  # validations
  validates :category, :status, :overview, :description, presence: true
  validates :program_id, presence: {message: "must be selected before creating a bug report"}
end
