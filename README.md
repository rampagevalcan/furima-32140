# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| -----------------| ---------| ----------- |
| nicname          | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| birth_year       | datetime | null: false |
| birth_manse      | datetime | null: false |
| birth_day        | datetime | null: false |

### Association
has_many: items
has_many: purchase_record

## items テーブル

| Column            | Type      | Options           |
| ------------------| ----------| ------------------|
| image_name        | string    | null: false       |
| image_description | text      | null: false       |
| category          | string    | null: false       |
| item_condition    | string    | null: false       |
| shopping_fee      | string    | null: false       |
| deliverytime      | datetime  | null: false       |
| price             | integer   | null: false       |
| user              | reference | foreign_key: true |

### Association
belongs_to: user
has_one: purchase_record

## addressesテーブル

| Column           | Type       | Options     |
| -----------------| ---------- | ------------|
| postal_code      | string     | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     | null: false |
| telephone_number | integer    | null: false |

### Association
has:one: purchase_record

## purchase_records テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
belongs_to: address