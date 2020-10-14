# テーブル設計

## users テーブル

| Column                | Type   | Option     |
| --------------------- | ------ | ---------- |
| nickname              | string | null:false |
| email                 | string | null:false |
| password              | string | null:false |
| password_confirmation | string | null:false |
| family_name           | string | null:false |
| first_name            | string | null:false |
| family_name-kana      | string | null:false |
| first_name_kana       | string | null:false |
| birthday              | date   | null:false |

### Association

- has_many :products
- has_many :purchases
- has_one :residence

## products テーブル

|Column      |Type        | Option                         |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| exposition | text       | null: false                    |
| category   | string     | null: false                    |
| status     | integer    | null: false                    |
| burden     | integer    | null: false                    |
| area       | integer    | null: false                    |
| days       | integer    | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Residences テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| address      | text       | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## Purchases

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |
| residence | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :residence