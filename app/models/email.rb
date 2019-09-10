class Email < ApplicationRecord
  belongs_to :user
  validates_presence_of :password_digest
  validates :email, uniqueness: true, presence: true
  has_secure_password
end
