class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :product_name, :text, :price, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は(−)を入れて7文字で入力してください' }
    validates :prefecture_id,   numericality: { other_than: 1, message: "は−−以外を選択してください" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :token
  end
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は(−)を抜いた11桁までを入力してください' }

  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number,
                   record_id: record.id)
  end
end