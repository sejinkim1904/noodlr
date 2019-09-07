class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews
  validates_presence_of :name,
                        :category,
                        :price,
                        :image

  def average_rating
    rating = reviews.average(:rating)
    rating.nil? ? 0 : rating
  end
end
