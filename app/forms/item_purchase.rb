class ItemPurchase
  include ActiveModel::Model
  attr_accessor :zip_code,
                :prefecture_id,
                :city,
                :house_number,
                :property_name,
                :phone_number,
                :user_id,
                :item_id

  def save
    ShippingAddress.create(
      zip_code:      zip_code,
      prefecture_id: prefecture_id,
      city:          city,
      house_number:  house_number,
      property_name: property_name,
      phone_number:  phone_number,
      item_id:       item_id
    )
    Purchase.create(
      user_id: user_id,
      item_id: item_id
    )
  end
end