class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_origin

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :description
    validates :category_id
    validates :shipping_origin_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_origin_id
  end
end
