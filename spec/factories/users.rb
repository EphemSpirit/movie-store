FactoryBot.define do
  factory :user do
    name { "Drew" }
    username { "EphemSpirit" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
