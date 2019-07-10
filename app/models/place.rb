class Place < ApplicationRecord
  # misc attributes
  paginates_per 5
  # associations
  belongs_to :user
  # validations
  validates :name, presence: true
end
