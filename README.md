# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|


### Association
- belongs_to :customer
- belongs_to :card
- has_many :items, through: :comments

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|string|null: false|
|price|string|null: false|
|condition|string|null: false|
|image|string|null: false|
|size|string|
|customer_id|string|null: false, foreign_key: true|
|user_id|string|null: false, foreign_key: true|
|category_id|string|null: false, foreign_key: true|


### Association
- belongs_to :category
- has_many :users, through: :comments

## customersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone|string|null: false|


### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|security|string|null: false|
|month|string|null: false|
|year|string|null: false|


### Association
- belongs_to :user

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many :items

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|item_id|string|null: false, foreign_key: true|
|comment|string|

### Association
- belongs_to :item
- belongs_to :user
