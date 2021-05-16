Movie.destroy_all
Director.destroy_all
CastMember.destroy_all
Casting.destroy_all
User.destroy_all

50.times do
  CastMember.create!(name: Faker::Name.name,
                    age: Faker::Number.between(from: 12, to: 98),
                    trivia_fact: Faker::TvShows::BojackHorseman.tongue_twister,
                    birthday: Faker::Date.between(from: '1990-01-01', to: '2015-12-31'),
                    birth_city: Faker::JapaneseMedia::DragonBall.planet)
end

25.times do
  Director.create!(name: Faker::Name.name, years_active: Faker::Number.between(from: 1, to: 25))
end

100.times do
  movie = Movie.create!(name: Faker::Movie.title,
                description: Faker::Lorem.paragraph(sentence_count: 5),
                rating: Faker::Number.decimal(l_digits: 1),
                genre: Faker::Book.genre,
                release_date: Faker::Date.between(from: '1980-01-01', to: Date.today),
                director: Director.all.sample)
end

100.times do
  Casting.create!(cast_member_id: CastMember.all.map(&:id).sample,
                  movie_id: Movie.all.map(&:id).sample)
end

100.times do |i|
  User.create!(email: "email_#{i}@example.com",
               name: Faker::Name.name,
               username: Faker::TvShows::NewGirl.character.gsub(" ", ""),
               password: "password",
               password_confirmation: "password")
end
