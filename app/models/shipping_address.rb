class ShippingAddress < ApplicationRecord
  belongs_to :item

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :property_name
    validates :phne_number
  end
end
