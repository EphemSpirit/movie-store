class Director < ApplicationRecord
  has_many :movies

  validates :name, :years_active, presence: true

end
