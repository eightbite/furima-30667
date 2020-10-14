# テーブル設計

## users テーブル

| Column                | Type   | Option     |
| --------------------- | ------ | ---------- |
| nickname              | string | null:false |
| email                 | string | null:false |
| password              | string | null:false |
| password_confirmation | string | null:false |
| name                  | string | null:false |
| name-kana             | string | null:false |
| birthday              | date   | null:false |

### Association

- has_many :products
- has_one :purchases

## products テーブル

|Column      |Type        | Option                         |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| exposition | text       | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| burden     | string     | null: false                    |
| area       | string     | null: false                    |
| days       | date       | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Purchases

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| address    | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product