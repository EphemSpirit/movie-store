FactoryBot.define do
  factory :user do
    name { "Drew" }
    username { "EphemSpirit" }
    email { "ephemspirit@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
