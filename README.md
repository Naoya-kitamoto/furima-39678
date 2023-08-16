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


## users
|Column             |Type    |Options                  |
|nickname           |string  |null: false              |
|email              |string  |null: false unique: true |
|password           |string  |null: false              |
|encrypted_password |string  |null: false              |
|first_name         |string  |null: false              |
|last_name          |string  |null: false              |
|first_name_kana    |string  |null: false              |
|last_name_kana     |string  |null: false              |
|birth_day          |integer |null: false              |
has_many :items
has_many :purchases

## items
|Column             |Type    |Options                  |
|user_id            |integer |foreign_key: true        |
|image              |string  |null: false              |
|item_name          |string  |null: false              |
|explanation        |text    |null: false              |
|category_id        |integer |null: false              |
|condition          |string  |null: false              |
|sender_id          |integer |null: false              |
|delivery_charge_id |integer |null: false              |
|delivery_days_id   |integer |null: false              |
|price              |integer |null: false              |
belongs_to :user
belongs_to :purchases

## purchases
|Column             |Type   |Options                   |
|user               |string |foreign_key: true         |
|item               |string |foreign_key: true         |
belongs_to :user
belongs_to :item

## addresses
|Column             |Type    |Options                  |
|post_code          |integer |null: false              |
|prefecture         |string  |null: false              |
|municipalities     |string  |null: false              |
|street_address     |integer |null: false              |
|building_name      |string  |null: false              |
|phone_number       |integer |null: false              |
belongs_to :purchases