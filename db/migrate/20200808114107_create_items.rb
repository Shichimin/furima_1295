class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                       null: false, default: ""
      t.text    :image,                      null: false, default: ""
      t.text    :description,                null: false, default: ""
      t.integer :price,                      null: false, default: ""
      t.integer :category_id,                null: false, default: ""
      t.integer :shipping_origin_id,         null: false, default: ""
      t.integer :condition_id,               null: false, default: ""
      t.integer :shipping_burden_id,         null: false, default: ""
      t.integer :estimated_shipping_date_id, null: false, default: ""
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
