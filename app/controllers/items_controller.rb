class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  def index
    @items = Item.includes(:image).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end
end
end

