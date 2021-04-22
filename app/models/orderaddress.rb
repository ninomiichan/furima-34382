class OrderAddress
  include ActiveModel::Model
  attr_accessor :user,:item,:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:order

  validates :post_code,     presence: { message: "郵便番号 を入力してください" }, on: :address_create
  validates :prefecture_id,   presence: { message: "都道府県 を選択してください" }, on: :address_create
  validates :city,            presence: { message: "市区町村 を入力してください" }, on: :address_create
  validates :address,           presence: { message: "番地 を入力してください" },    on: :address_create
  validates :phone_number,

  def save
      order = Order.create(user: user, item: item)
     
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number,order: order)
    end
  end
end