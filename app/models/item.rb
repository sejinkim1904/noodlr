class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :price
  validates_presence_of :image
  validates_presence_of :restaurant
end
