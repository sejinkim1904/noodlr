class Restaurant < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  validates_presence_of :name,
                        :rating,
                        :latitude,
                        :longitude,
                        :address_1,
                        :city,
                        :state,
                        :zip_code,
                        :phone

  validates :yelp_id, presence: true, uniqueness: true
  has_many :items
  has_many :users

  def num_pending
    items.where(items: {status: 'pending'}).count
  end
end
