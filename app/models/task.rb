    class Task < ApplicationRecord
    # associations
    belongs_to :user
    belongs_to :program, optional: true

    # validations
    validates :urgency, presence: true
    validates :title, presence: true, length: { maximum: 50}
    validates :program_id, presence: {message: "must be selected to continue"}

    # scope method
    scope :urgent, -> {where("urgency == ?", "high")}
end
