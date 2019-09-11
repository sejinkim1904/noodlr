class Item < ApplicationRecord
  searchkick word_start: [:name]
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

  def self.by_avg_rating
    select("items.*, AVG(reviews.rating) AS average_rating")
      .joins(:reviews)
      .group(:id)
      .order("average_rating DESC")
      .limit(5)
  end
end

Item.reindex
