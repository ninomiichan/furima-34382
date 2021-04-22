class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :item_user, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
  end
    

  def edit
  end

  def update
    if @item.update(item_params)
       @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :category_id, :itemtext, :title, :condition_id, :postage_id, :prefecture_id, :shipping_day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_user
    redirect_to root_path  unless current_user.id == @item.user.id
  end
end
