class CastMember < ApplicationRecord
  validates :name, :age, presence: true
  has_many :castings
  has_many :movies, through: :castings

  scope :youth_actors, -> { where("age < ?", "15") }
end
