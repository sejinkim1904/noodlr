class Restaurant < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  validates_presence_of :name, :latitude, :longitude
  has_many :items
end
