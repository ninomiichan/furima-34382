class OrderController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if  @order_address.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

private

def order_params
  params.require(:order).permit(:price).merge(token: params[:token])
end

def pay_item
  Payjp.api_key = "sk_test_ab1bafde797142cd9c2b55ee"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: order_params[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end
