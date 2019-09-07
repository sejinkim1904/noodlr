class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews
  validates_presence_of :name,
                        :category,
                        :price,
                        :image

  def average_rating
    reviews.average(:rating)
  end
end
