require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user =FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end
  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '全て正常の時' do
        expect(@item).to be_valid
      end
    end
  
    it 'category_idが0では登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 0"
    end
    it 'condition_idが0では登録できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition must be other than 0"
    end
      it 'postage_idが0では登録できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 0"
      end
      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it 'shipping_day_idが0では登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day must be other than 0"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title 商品名 を入力してください"
      end
      it 'itemtextが空では登録できない' do
        @item.itemtext = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Itemtext 商品の説明 を入力してください"
        end
        it 'priceが全角数字では登録できないこと' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
        end
        it 'priceが半角英数混合では登録できないこと' do
          @item.price = 'a11'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
        end
        it 'priceが半角英語だけでは登録できないこと' do
          @item.price = 'aaa'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
        end
        it 'priceが299円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
        end
        it 'priceが10,000,000以上では登録できないこと' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include "Price 価格 は300以上9999999以下の数字で入力してください"
        end
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image 商品画像を選択してください"
      end
  end
end