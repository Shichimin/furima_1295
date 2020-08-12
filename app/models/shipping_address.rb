class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :item

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :city
    validates :house_number
    
    # 郵便番号は必ずハイフンを含む
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    
    # 都道府県の選択が「--」のときは保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1 }

    # 電話番号は11桁以内
    validates :phone_number, length: { maximum: 11 }  
  end


end
