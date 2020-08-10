FactoryBot.define do
  factory :item do
    name                       { 'test' }
    description                { 'text' }
    price                      { 300 }
    category_id                { 2 }
    shipping_origin_id         { 2 }
    condition_id               { 2 }
    shipping_burden_id         { 2 }
    estimated_shipping_date_id { 2 }
    user_id                    { 1 }
    user
  end
end
