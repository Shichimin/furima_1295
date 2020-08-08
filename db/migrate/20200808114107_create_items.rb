class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :image
      t.text    :description
      t.integer :price
      t.integer :category_id
      t.integer :shipping_origin_id
      t.integer :condition_id
      t.integer :shipping_burden_id
      t.integer :estimated_shipping_date_id
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
