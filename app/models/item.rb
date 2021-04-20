class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  # validation
    validates :title              , presence: { message: "商品名 を入力してください" }        , length: { maximum: 40, message: "商品名 は40文字以内で入力してください" }
    validates :itemtext              , presence: { message: "商品の説明 を入力してください" }     , length: { maximum: 1000, message: "商品の説明 は1000文字以内で入力してください" }
    validates :condition_id         , presence: { message: "商品の状態 を選択してください" }
    validates :category_id          , presence: { message: "商品の商品のカテゴリー を選択してください" }
    validates :postage_id          , presence: { message: "配送料の負担 を選択してください" }
    validates :prefecture_id     , presence: { message: "発送元の地域 を選択してください" }
    validates :shipping_day_id  , presence: { message: "発送までの日数 を選択してください" }
    validates :price             , presence: { message: "価格 を入力してください" }
    validates :price,       numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message: "価格 は300以上9999999以下の数字で入力してください" }
    with_options  numericality: { other_than: 0 }do
    validates :condition_id
   validates :category_id 
   validates :postage_id
   validates :prefecture_id
   validates :shipping_day_id
end 
   validates :image , presence:{ message:"商品画像を選択してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day
 
end


