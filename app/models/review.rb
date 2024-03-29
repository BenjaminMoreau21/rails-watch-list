class Review < ApplicationRecord
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
