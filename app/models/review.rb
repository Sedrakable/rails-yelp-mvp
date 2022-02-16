class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating,  presence: true
  validates :rating, inclusion: { in: (0..5).to_a, message: "%{value} is not a rating from 1 to 5"}, numericality: { only_integer: true }
end
