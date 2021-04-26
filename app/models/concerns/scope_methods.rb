module ScopeMethods
  extend ActiveSupport::Concern # brings in methods for concerns
  
  # Scope method to sort names alphabetically
  included do
    scope :alpha_names, -> { order(:name) }
  end
end