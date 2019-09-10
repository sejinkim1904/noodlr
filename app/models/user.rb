class User < ApplicationRecord
  has_many :reviews
  has_many :emails
  has_many :facebooks
  has_many :googles

  validates :restaurant_id, presence: true, if: :restaurant?
  validates_presence_of :role, :auth_type, :registered
  enum role: [:default, :restaurant, :photographer, :critic, :admin]
  enum auth_type: [:email, :facebook, :google]

  def reviewable?(item_id)
    Review.where(item_id: item_id, user: self).empty?
  end

  def restaurant?
    role == "restaurant"
  end
end
