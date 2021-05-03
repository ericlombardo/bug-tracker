class Task < ApplicationRecord
    # associations
    belongs_to :user
    belongs_to :bug
    has_one :program, through: :bug
end
