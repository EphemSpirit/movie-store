FactoryBot.define do
  factory :director do
    name { "Jimtestertest" }
    years_active { 3 }
    trait :with_movie do
      after(:create) do |director|
        director.movie_ids << create(:movie).id
      end
    end
  end
end
