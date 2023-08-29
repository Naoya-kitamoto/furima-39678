FactoryBot.define do
  factory :address do
    association :purchase, factory: :purchase
    municipalities{"川崎市"}
    street_address{"5-5-5"}
    phone_number{"09009000900"}
    post_code{"123-4567"}
    sender_id{14}
  end
end
