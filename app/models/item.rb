class Item < ApplicationRecord
  validates :item_name,           presence: true
  validates :explanation,         presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is enter between 299 and 1000000"},
                                  format: { with: /\A\d+\z/, message: "only use half width number" }
  validates :image,               presence: true

  belongs_to :user
  #has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :sender
end
