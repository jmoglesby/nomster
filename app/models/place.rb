class Place < ApplicationRecord
  # misc attributes
  paginates_per 5
  # associations
  belongs_to :user
  has_many :comments
  # geocoding
  geocoded_by :address
  after_validation :geocode
  # validations
  validates :name, presence: true, length: { minimum: 4 }
  validates :address, :description, presence: true
end
