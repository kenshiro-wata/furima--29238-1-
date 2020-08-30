# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| name                      | string | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| confirmation password     | string | null: false |
| last_name                 | string | null: false |
| first_name                | string | null: false |
| last_name_kana            | string | null: false |
| first_name_kana           | string | null: false |
| birth                     | date   | null: false |

### Association

- has_many :items
- has_many :deal


## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               |            | null: false |
| name                | string     | null: false |
| description         | text       | null: false |
| category            | integer    | null: false |
| status              | integer    | null: false |
| shipping_charges    | integer    | null: false |
| ship_from_address   | integer    | null: false |
| date_takes          | integer    | null: false |
| price               | Int        | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- has_one :deal
- belongs_to :user

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | -----------| ----------- |
| address_city           | String     | null: flase |
| block_number           | String     | null: flase |
| phone_number           | String     | null: flase |
| item                   | references | null: false, foreign_key: true |


### Association

- belongs_to :item

## deal テーブル

| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item