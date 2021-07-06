class Movie < ApplicationRecord
  validates :name, :description, :rating, :genre, :release_date, presence: true

  belongs_to :director, foreign_key: :director_id
  has_many :castings
  has_many :cast_members, through: :castings
  has_many :comments, as: :commentable
  has_many :likes, as: :likable

  scope :best_films, -> { where("rating > ?", "9.0")
                               .order(rating: :desc) }
  scope :horror, -> { where("genre = ?", "Horror") }
  scope :comedy, -> { where("genre = ?", "Comedy") }
end
