class Review < ApplicationRecord
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :comment, :rating, presence: true
end
