class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :rating, presence: true,
    numericality: { greater_than: 0, less_than: 6 }
  validates_presence_of :title,
                        :body,
                        :user_id,
                        :item_id
end
