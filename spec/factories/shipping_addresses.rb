FactoryBot.define do
  factory :shipping_address do
    zip_code                   { '100-0000' }
    prefecture_id              { 14 }
    city                       { "千代田区" }
    house_number               { "1-1" }
    property_name              { "" }
    phone_number               { '00000000000' }
    item_id                    { 1 }
    item
  end
end
