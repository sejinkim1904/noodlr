class Restaurant < ApplicationRecord
  validates_presence_of :name,
                        :rating,
                        :latitude,
                        :longitude,
                        :address_1,
                        :address_2,
                        :city,
                        :state,
                        :zip_code,
                        :phone
                        
  validates :yelp_id, presence: true, uniqueness: true
  has_many :items
end
