class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :sender_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id,
                :token

  attr_writer :user, :item

  with_options presence: true do
    validates :municipalities
    validates :street_address
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/,
      message: 'is invalid. Must be 10 to 11 digits'
    }
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end
  validates :sender_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(post_code:, sender_id:, municipalities:, street_address:,
                   building_name:, phone_number:, purchase_id: purchase.id)
  end
end
