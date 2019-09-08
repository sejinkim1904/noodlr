class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :first_name, :last_name, :role
  validates_presence_of :password_digest, :registered
  validates :email, presence: true, uniqueness: true
  enum role: [:default, :restaurant, :photographer, :critic, :admin]
  has_secure_password

  def reviewable?(item)
    Review.where(item: item, user: self).empty?
  end
end
