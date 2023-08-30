FactoryBot.define do
  factory :purchase_address do
    municipalities { '川崎市' }
    street_address { '5-5-5' }
    building_name { 'ヨーロッパビル' }
    phone_number { '09009000900' }
    post_code { '123-4567' }
    sender_id { 14 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
