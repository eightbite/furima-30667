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
| family_name_kana      | string | null:false |
| first_name_kana       | string | null:false |
| birthday              | date   | null:false |

### Association

- has_many :products
- has_many :purchases

## products テーブル

|Column      |Type        | Option                         |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| exposition | text       | null: false                    |
| category   | integer    | null: false                   |
| status_id  | integer    | null: false                    |
| burden_id  | integer    | null: false                    |
| area_id    | integer    | null: false                    |
| days_id    | integer    | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Residences テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchases    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## Purchases

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :residence