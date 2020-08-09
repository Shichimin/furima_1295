class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  # ↑アソシエーションの定義（履歴を残すための空commit）

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :image
    validates :description
  end

  validates :category_id, numericality: { other_than: 1 }
end
