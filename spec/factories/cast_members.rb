FactoryBot.define do
  factory :cast_member do
    name { "MyString" }
    age { 1 }
    trivia_fact { "MyString" }
    birthday { "2021-05-09" }
    birth_city { "MyString" }
    movies { nil }
  end
end
