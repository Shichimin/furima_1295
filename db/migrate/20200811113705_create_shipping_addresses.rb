class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :zip_code,      null: false, default: ""
      t.integer :prefecture_id, null: false
      t.string  :city,          null: false, default: ""
      t.string  :house_number,  null: false, default: ""
      t.string  :property_name
      t.string  :phone_number,  null: false, default: ""
      t.integer :item_id,       foreign_key: true
      t.timestamps
    end
  end
end
