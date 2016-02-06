class Recipe < ApplicationRecord
    DIFFICULTY = %w(Easy Medium Hard)
    belongs_to :food_type
    belongs_to :food_preference
    belongs_to :cuisine
end
