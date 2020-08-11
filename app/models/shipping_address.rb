class ShippingAddress < ApplicationRecord
  belongs_to_active_hash :prefecture

  belongs_to :item

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :zip_code
    validates :prefecture
    validates :city
    validates :house_number
    validates :property_name
    validates :phone_number
  end

  #都道府県の選択が「--」のときは保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 } 
end
