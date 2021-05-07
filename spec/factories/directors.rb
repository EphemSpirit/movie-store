FactoryBot.define do
  factory :director do
    name { "Jim" }
    years_active { 3 }
    # factory :director_with_movie do
    #   transient do
    #     movies_count { 1 }
    #   end
    #
    #   after(:create) do |director, evaluator|
    #     create_list(:director, evaluator.movies_count, director: director)
    #     director.reload
    #   end
    # end
  end
end
