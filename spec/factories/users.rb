FactoryBot.define do
  factory :user do
    name { "Drew" }
    username { "EphemSpirit" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    trait :with_watchlist do
      after(:create) do |user|
        user.wishlist.movies << create(:movie)
      end
    end
  end
end
