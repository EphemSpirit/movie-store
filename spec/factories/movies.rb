require 'date'

FactoryBot.define do
  factory :movie do
    title { "Test movie" }
    rating { 3.34 }
    description { "This is a test summary" }
    genre { "Adventure" }
    release_date { Date.new(2001, 2, 3).strftime('%a, %d %b %Y') }
    director factory: :director
  end
end
