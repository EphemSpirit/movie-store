class Casting < ApplicationRecord
  belongs_to :movie
  belongs_to :cast_member
end
