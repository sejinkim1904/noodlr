class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :title,
                        :body,
                        :rating,
                        :user_id,
                        :item_id
end
