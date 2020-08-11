require 'rails_helper'
describe ShippingAddress, type: :model do
  before do
    @shipping_address = FactoryBot.build(:shipping_address)
  end

  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it 'zip_code, prefecture_id, city, house_number, phone_numberが存在する' do
        expect(@shipping_address).to be_valid
      end
      it 'zip_codeにハイフンが存在する' do
        @shipping_address.zip_code = '000-0000'
        expect(@shipping_address).to be_valid
      end
      it 'phone_numberが11桁以内である' do
        @shipping_address.phone_number = '00000000000'
        expect(@shipping_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'zip_codeが空だと購入できない' do
        @shipping_address.zip_code = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'prefectureが空だと購入できない' do
        @shipping_address.prefecture_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @shipping_address.city = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @shipping_address.house_number = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @shipping_address.phone_number = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'zip_codeにハイフンが存在しないと購入できない' do
        @shipping_address.zip_code = '0000000'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'phone_numberの11桁より大きいと購入できない' do
        @shipping_address.phone_number = '000000000000'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end