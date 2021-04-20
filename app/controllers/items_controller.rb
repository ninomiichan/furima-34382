class ItemsController < ApplicationController

  
  before_action :authenticate_user!, except: [:show,:index]
  def index
  end

  def new
    @item = Item.new
   
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
      render :new
    end
  end
  

  def show
    # if user_signed_in?
    #   redirect_to new_item_path(@item) if @item== current_user.id
    # end
    # @seller_items = Item.where @item.where.not(id: params[:id]).order('id DESC').limit(6).includes(:images)
  end

private
def item_params
  params.require(:item).permit(:image, :category_id, :itemtext, :title, :condition_id, :postage_id, :prefecture_id, :shipping_day_id,:price).merge(user_id: current_user.id)
end
end
