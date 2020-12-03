# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| -------------------| ---------| ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false unique: true |
| encrypted_password | string   | null:false               |
| family_name        | string   | null: false              | 
| first_name         | string   | null: false              |
| family_name_kana   | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

### Association
has_many: items
has_many: purchase_records

## items テーブル

| Column            | Type       | Options           |
| ------------------| ---------- | ------------------|
| item_name         | string     | null: false       |
| item_description  | text       | null: false       |
| category_id       | integer    | null: false       |
| item_condition_id | integer    | null: false       |
| shopping_fee_id   | integer    | null: false       |
| prefecture_id     | integer    | null: false       |
| delivery_time_id  | integer    | null: false       |
| price             | integer    | null: false       |
| user              | reference  | foreign_key: true |

### Association
belongs_to: user
has_one: purchase_record

## addressesテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase_record  | reference  | null: false, foreign_kry: true |

### Association
belongs_to: purchase_record

## purchase_records テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address