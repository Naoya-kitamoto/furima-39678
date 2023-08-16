class Item < ApplicationRecord
  validates :item_name,         presence: true
  validates :explanation,         presence: true
  validates :category_id,         presence: true
  validates :sender_id,         presence: true
  validates :delivery_charge_id,         presence: true
  validates :delivery_day_id,         presence: true
  validates :price,         presence: true

  belongs_to :user
  has_one :purchase
end
