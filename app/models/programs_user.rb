class ProgramsUser < ApplicationRecord
  belongs_to :user
  belongs_to :program
end
