class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # ActiveHashのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :estimated_shipping_date

  # ActiveStoregeのアソシエーション
  has_one_attached :image

  # Userテーブルとのアソシエーション
  belongs_to :user

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :description
    validates :category_id
    validates :shipping_origin_id
    validates :condition_id
    validates :shipping_burden_id
    validates :estimated_shipping_date_id
  end

  # ジャンルの選択が「--」のときは保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_origin_id
    validates :condition_id
    validates :shipping_burden_id
    validates :estimated_shipping_date_id
  end

  # priceの範囲が「¥300〜¥9,999,999」の間でないと保存できないようにする
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }  
end
