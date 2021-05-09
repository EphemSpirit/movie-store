class Movie < ApplicationRecord
  validates :title, :description, :rating, :genre, :release_date, presence: true

  belongs_to :director, foreign_key: :director_id
  has_many :castings
  has_many :cast_members, through: :castings
end
