FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user_id { create(:user).id }

    trait :for_movie do
      association :commentable, factory: :movie
    end

    trait :for_comment do
      association :commentable, factory: :comment
    end
  end
end
