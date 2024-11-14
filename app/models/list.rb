class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, :image_url, presence: true
  validates :name, uniqueness: true
end
