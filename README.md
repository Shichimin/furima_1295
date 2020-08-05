# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_year       | int    | null: false |
| birth_month      | int    | null: false |
| birth_day        | int    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :likes
- has_many :credit_cards
- has_many :purchase_information


## items テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| item_name               | string  | null: false                    |
| category                | string  | null: false                    |
| price                   | int     | null: false                    |
| item_images             | string  | null: false                    |
| description             | text    | null: false                    |
| shipping_origin         | string  | null: false                    |
| condition               | string  | null: false                    |
| is_purchase             | boolean | null: false                    |
| shipping_burden         | string  | null: false                    |
| estimated_shipping_date | string  | null: false                    |
| user_id                 | int     | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :transaction

## comments テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| text    | string    | null: false                    |
| user_id | int       | null: false, foreign_key: true |
| item_id | int       | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | int        | null: false, foreign_key: true |
| item_id | int        | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## credit_cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | int        | null: false                    |
| expiry_year   | int        | null: false                    |
| expiry_month  | int        | null: false                    |
| security_code | int        | null: false                    |
| user_id       | int        | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :transaction

## purchase_information テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | int        | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| property_name | string     |                                |
| phone_number  | int        | null: false, foreign_key: true |
| user_id       | int        | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :transaction

## transactions テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_id                 | int        | null: false, foreign_key: true |
| purchase_information_id | int        | foreign_key: true              |
| credit_card_id          | int        | foreign_key: true              |

### Association

- belongs_to :item
- belongs_to :credit_card
- has_one :purchase_information
