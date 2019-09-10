class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :first_name, :last_name, :role
  validates_presence_of :password_digest, :registered
  validates :email, presence: true, uniqueness: true
  validates :restaurant_id, presence: true, if: :restaurant?
  enum role: [:default, :restaurant, :photographer, :critic, :admin]
  has_secure_password

  def reviewable?(item_id)
    Review.where(item_id: item_id, user: self).empty?
  end

  def restaurant?
    role == "restaurant"
  end
end
