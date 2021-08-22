require 'date'

FactoryBot.define do
  factory :movie do
    name { "Test movie" }
    rating { 3.34 }
    description { "This is a test summary" }
    genre { "Adventure" }
    release_date { Date.new(2001, 2, 3).strftime('%a, %d %b %Y') }
    director factory: :director
    wishlist factory: :wishlist
    trait :with_cast do
      after(:create) do |movie|
        movie.cast_members << create(:cast_member)
      end
    end
  end
end
