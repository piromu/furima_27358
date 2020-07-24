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
|birthday|integer|null: false|


### Association
- has_many :items
- has_many :comments
- has_many :managements

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|price_id|integer|null: false|
|condition_id|integer|null: false|
|postage_id|integer|null: false|
|image|string|null: false|
|size|string|
|customer|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|


### Association
- belongs_to :category
- belongs_to :management
- has_many :users

## customersテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana_id|integer|null: false|
|first_name_kana_id|integer|null: false|
|post_code|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone|string|null: false|


### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many :items

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|comment|text|

### Association
- belongs_to :item
- belongs_to :user

## managementテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user