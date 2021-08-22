class Movie < ApplicationRecord
  validates :name, :description, :rating, :genre, :release_date, presence: true

  belongs_to :director, foreign_key: :director_id
  has_many :castings
  has_many :cast_members, through: :castings
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy
  belongs_to :wishlist

  FANTASY = %w[Fable, Fantasy, Legend, Mythology, Folklore]
  ADVENTURE = ['Science fiction', 'Crime/Detective', 'Tall tale', 'Western']
  EDUCATIONAL = ['Speech', 'Narrative nonfiction', 'Realistic fiction', 'Reference book', 'Mythology', 'Textbook']

  scope :best_films, -> { where("rating > ?", "9.0")
                               .order(rating: :desc)
                               .limit(10) }
  scope :recent_films, -> { where("release_date < ?", 5.years.ago) }
  scope :fantasy, -> { where(genre: FANTASY) }
  scope :adventure, -> { where(genre: ADVENTURE) }
  scope :educational, -> { where(genre: EDUCATIONAL) }
end
