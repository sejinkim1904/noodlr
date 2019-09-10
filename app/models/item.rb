class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews
  accepts_nested_attributes_for :reviews
  validates_presence_of :name,
                        :category,
                        :status,
                        :image

  validates :price, presence: true,
  numericality: { greater_than: 0, less_than: 100 }

  def average_rating
    rating = reviews.average(:rating)
    rating.nil? ? 0 : rating
  end
end
