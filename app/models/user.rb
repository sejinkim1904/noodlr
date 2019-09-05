class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :role
  validates_presence_of :password_digest, :registered
  validates :email, presence: true, uniqueness: true
  enum role: [:default, :restaurant, :photographer, :critic, :admin]
  has_secure_password

end
