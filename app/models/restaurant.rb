class Restaurant < ApplicationRecord
  validates_presence_of :name, :latitude, :longitude
  has_many :items
  has_many :users

  def num_pending
    items.where(items: {status: 'pending'}).count
  end
end
