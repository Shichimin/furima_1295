class User < ApplicationRecord

  # 各テーブルとのアソシエーション
  has_many :items
  has_many :purchase

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email,    format: { with: /\A\S+@\S+\.\S+\z/ },
                         uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },
                         confirmation: true

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end
