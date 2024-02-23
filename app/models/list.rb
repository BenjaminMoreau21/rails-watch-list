class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  validates :name, uniqueness: true, presence: true
  validates :photo, presence: true
  has_one_attached :photo
end
