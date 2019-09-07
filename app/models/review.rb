class Review < ApplicationRecord
  belongs_to :item
  validates_presence_of :title,
                        :body,
                        :rating
end
