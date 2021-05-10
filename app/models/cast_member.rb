class CastMember < ApplicationRecord
  validates :name, :age, presence: true
  has_many :castings
  has_many :movies, through: :castings
end
