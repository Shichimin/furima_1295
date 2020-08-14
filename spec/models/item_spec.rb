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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it 'categoryが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'conditionが空だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'shipping_burdenが空だと出品できない' do
        @item.shipping_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'shipping_originが空だと出品できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'estimated_shiipping_dateが空だと出品できない' do
        @item.estimated_shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceの範囲が300~9999999の間でないと出品できない（priceの値が300より小さい場合）' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は300以上の値にしてください')
      end
      it 'priceの範囲が300~9999999の間でないと出品できない（priceの値が9999999より大きい場合）' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は10000000より小さい値にしてください')
      end
      it 'カテゴリーの選択が「--」のときは出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it '配送料の負担の選択が「--」のときは出品できない' do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it '商品の状態の選択が「--」のときは出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it '配送元の地域の選択が「--」のときは出品できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it '発送日の目安の選択が「--」のときは出品できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
    end
  end
end
