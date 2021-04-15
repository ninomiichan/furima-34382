require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '全て正常の時' do
        expect(@item).to be_valid
      end
    end
  
    it 'category_idが0では登録できない' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'condition_idが0では登録できない' do
      @item.condition_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include "Email can't be blank"
    end
      it 'postage_idが0では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Family name can't be blank"
      end
      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "First name can't be blank"
      end
      it 'shipping_day_idが0では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Password can't be blank"
      end
      it 'itemtextが空では登録できない' do
        @item.itemtext = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Birth day can't be blank"
      end
  end
end




