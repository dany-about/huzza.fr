class DifficultyRating < ApplicationRecord
  belongs_to :user
  belongs_to :dare

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
