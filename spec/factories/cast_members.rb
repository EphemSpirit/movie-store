FactoryBot.define do
  factory :cast_member do
    name { "Joni" }
    age { 34 }
    trivia_fact { "MyString" }
    birthday { "2021-05-09" }
    birth_city { "Yonkers" }
    trait :with_movies do
      after(:create) do |cast_member|
        cast_member.movies << create(:movie)
      end
    end
  end
end
