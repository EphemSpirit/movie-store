class Movie < ApplicationRecord
  validates :title, :description, :rating, :genre, :release_date, presence: true
end
