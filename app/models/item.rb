class Item < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true
end
