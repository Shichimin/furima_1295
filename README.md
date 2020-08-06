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
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :likes
- has_many :purchase_information

## items テーブル

| Column                     | Type    | Options                        |
| -------------------------- | ------- | ------------------------------ |
| name                       | string  | null: false                    |
| images                     | string  | null: false                    |
| description                | text    | null: false                    |
| price                      | int     | null: false                    |
| category_id                | int     | null: false                    |
| shipping_origin_id         | int     | null: false                    |
| condition_id               | int     | null: false                    |
| shipping_burden_id         | int     | null: false                    |
| estimated_shipping_date_id | int     | null: false                    |
| user_id                    | int     | null: false, foreign_key: true |

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

## purchase_information テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | int        | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| property_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | int        | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :transaction

## transactions テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_id                 | int        | null: false, foreign_key: true |
| purchase_information_id | int        | foreign_key: true              |

### Association

- belongs_to :item
- has_one :purchase_information
