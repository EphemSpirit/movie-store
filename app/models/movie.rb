class Movie < ApplicationRecord
  validates :name, :description, :rating, :genre, :release_date, presence: true

  belongs_to :director, foreign_key: :director_id
  has_many :castings
  has_many :cast_members, through: :castings

  scope :best_films, -> { Movie.where("rating > ?", 9.0)
                               .order(rating: :desc) }
end
