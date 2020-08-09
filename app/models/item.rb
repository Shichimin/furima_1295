class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :estimated_shipping_date

  belongs_to :user

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_origin_id
    validates :condition_id
    validates :shipping_burden_id
    validates :estimated_shipping_date_id
  end
end
