class CategoryId < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id

  has_ancestry
  has_many :items 
end
