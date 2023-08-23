FactoryBot.define do
  factory :item do
    item_name{Faker::Name.name}
    explanation{"ツルツルです"}
    category_id{3}
    condition_id{2}
    sender_id{4}
    delivery_charge_id{3}
    delivery_day_id{6}
    price{5000}
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/furima_image.png'), filename: 'furima_image.png') 
    end
  end
end
