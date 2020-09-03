# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| name                      | string | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| password_confirmation     | string | null: false |
| last_name                 | string | null: false |
| first_name                | string | null: false |
| last_name_kana            | string | null: false |
| first_name_kana           | string | null: false |
| birth                     | date   | null: false |

### Association

- has_many :items
- has_many :manages


## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               | string     | null: false |
| name                | string     | null: false |
| description         | text       | null: false |
| category            | integer    | null: false |
| status              | integer    | null: false |
| shipping_charges    | integer    | null: false |
| ship_from_address   | integer    | null: false |
| date_takes          | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- has_one : manage
- belongs_to :user

## manages テーブル

| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | -----------| ----------- |
| postal_code            | String     | null: flase |
| prefecture             | String     | null: flase |
| address_city           | String     | null: flase |
| block_number           | String     | null: flase |
| building_number        | String     |             |
| phone_number           | String     | null: flase |
| manage                 | references | null: false, foreign_key: true |


### Association

- belongs_to :manage