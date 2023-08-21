FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name{"武史"}
    last_name{"田中"}
    first_name_kana{"タケシ"}
    last_name_kana{"タナカ"}
    birth_day{"1999-10-02"}
  end
end