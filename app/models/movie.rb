class Movie < ApplicationRecord
  validates :title, :description, :rating, :genre, :release_date, presence: true

  belongs_to :director, foreign_key: :director_id

end
