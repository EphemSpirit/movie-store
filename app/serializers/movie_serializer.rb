class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre, :rating, :release_date
  belongs_to :director
  has_many :cast_members, through: :castings
end
