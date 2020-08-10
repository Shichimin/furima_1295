require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test_image.jpg')
  end

  describe '商品の新規出品' do
    context '出品がうまくいくとき' do
      it 'name, image, description, price, category_id, condition_id, shipping_burden_id, shipping_origin_id, estimated_shipping_date_idが存在する' do
        expect(@item).to be_valid
      end
      it 'priceの範囲が300~9999999の間である' do
        @item.price = 300
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'categoryが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_burdenが空だと出品できない' do
        @item.shipping_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end
      it 'shipping_originが空だと出品できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it 'estimated_shiipping_dateが空だと出品できない' do
        @item.estimated_shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end
      it 'priceの範囲が300~9999999の間でないと出品できない（priceの値が300より小さい場合）' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceの範囲が300~9999999の間でないと出品できない（priceの値が9999999より大きい場合）' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end
