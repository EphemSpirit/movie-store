class Director < ApplicationRecord
  has_many :movies

  validates :name, :years_active, presence: true

  #I know this is not the best metric for 'best'
  #maybe change this to where their average movie rating is above an 8 or something
  #scope :best_directors, -> { Director.where("#{average_rating} > ?", 0.800e1) }
  scope :top_directors, -> { where("#{self.average_rating} > ?", "8.0") }
  scope :classic, -> { where("years_active > ?", "10") }

  def average_rating
    movies.map(&:rating).inject(:+) / movies.length
  end

end
