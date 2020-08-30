# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| name                      | string | null: false |
| email                     | string | null: false |
| password                  | string | null: false |
| confirmation password     | string | null: false |
| last name                 | string | null: false |
| first name                | string | null: false |
| birth                     | string | null: false |

### Association

- has_many :items


## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               |            | null: false |
| name                | string     | null: false |
| description         | string     | null: false |
| category            | string     | null: false |
| item_status         | string     | null: false |
| shipping_charges    | string     | null: false |
| ship_from_address   | string     | null: false |
| date_takes          | string     | null: false |
| price               | Int        | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :purchases
- belongs_to :user

## purchases テーブル

| Column                 | Type       | Options     |
| ---------------------- | -----------| ----------- |
| image                  |            | null: false |
| name                   | string     | null: false |
| credit_security_number | Int        | null: flase |
| credit_valid           | Int        | null: flase |
| credit_code            | Int        | null: flase |
| address_city           | String     | null: flase |
| block_number           | String     | null: flase |
| phone_number           | Int        | null: flase |
| item                   | references | null: false, foreign_key: true |


### Association

- belongs_to :item