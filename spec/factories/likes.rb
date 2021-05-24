FactoryBot.define do
  factory :like do
    likable_type { "MyString" }
    likable_id { 1 }
    user_id { 1 }
  end
end
