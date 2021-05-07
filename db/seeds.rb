Movie.destroy_all

25.times do
  Director.create(name: Faker::Name.name, years_active: Faker::Number.between(from: 1, to: 25))
end

100.times do
  Movie.create!(title: Faker::Movie.title,
                description: Faker::Lorem.paragraph(sentence_count: 5),
                rating: Faker::Number.decimal(l_digits: 1),
                genre: Faker::Book.genre,
                release_date: Faker::Date.between(from: '1980-01-01', to: Date.today),
                director: Director.all.sample)
end
