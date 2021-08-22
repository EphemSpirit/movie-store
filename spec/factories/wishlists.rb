FactoryBot.define do
  factory :wishlist do
    user factory: :user
    movie_id { 1 }
  end
end
