class Task < ApplicationRecord
    # associations
    belongs_to :user
    belongs_to :program
end
