class Item < ApplicationRecord
  validates_presence_of :name,
                        :category,
                        :price,
                        :image,
                        :restaurant
end
