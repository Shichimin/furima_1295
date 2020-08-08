FactoryBot.define do
  factory :user do
    nickname              { 'test太郎' }
    email                 { 'kkk@gmail.com' }
    password              { 'a00000' }
    password_confirmation { password }
    family_name           { '手簀戸' }
    first_name            { '太郎' }
    family_name_kana      { 'テスト' }
    first_name_kana       { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
