class Item < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :name,
                        :category,
                        :price,
                        :image,
                        :restaurant
end
