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


## usersテーブル
|Column             |Type       |Options                  |
|-------------------|-----------|-------------------------|
|nickname           |string     |null: false              |
|email              |string     |null: false unique: true |
|encrypted_password |string     |null: false              |
|first_name         |string     |null: false              |
|last_name          |string     |null: false              |
|first_name_kana    |string     |null: false              |
|last_name_kana     |string     |null: false              |
|birth_day          |date       |null: false              |
has_many :items
has_one :purchases

## itemsテーブル
|Column             |Type       |Options                  |
|-------------------|-----------|-------------------------|
|user               |references |foreign_key: true null: false |
|item_name          |string     |null: false              |
|explanation        |text       |null: false              |
|category_id        |integer    |null: false              |
|condition_id       |integer    |null: false              |
|sender_id          |integer    |null: false              |
|delivery_charge_id |integer    |null: false              |
|delivery_days_id   |integer    |null: false              |
|price              |integer    |null: false              |
belongs_to :user
belongs_to :purchase

## purchasesテーブル
|Column             |Type       |Options                   |
|-------------------|-----------|--------------------------|
|user               |references |foreign_key: true null: false |
|item               |references |foreign_key: true null: false |
belongs_to :user
belongs_to :item
belongs_to :address

## addressesテーブル
|Column             |Type       |Options                  |
|-------------------|-----------|-------------------------|
|post_code          |string     |null: false              |
|prefecture_id      |integer    |null: false              |
|municipalities     |string     |null: false              |
|street_address     |string     |null: false              |
|building_name      |string     |                         |
|phone_number       |string     |null: false              |
|purchase           |references|foreign_key: true null: false |
belongs_to :purchase