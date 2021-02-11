class City < ApplicationRecord
  has_many :users

  validates :zip_code,
  presence: true

  validates :name,
  presence: true
end
