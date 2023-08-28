class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :municipalities
    validates :street_address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end