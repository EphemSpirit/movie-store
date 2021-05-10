FactoryBot.define do
  factory :casting do
    association :cast_member
    association :movie
  end
end
