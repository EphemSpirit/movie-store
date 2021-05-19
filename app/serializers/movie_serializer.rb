class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :genre, :rating, :release_date
  belongs_to :director
  has_many :cast_members, through: :castings
  has_many :comments, as: :commentable
end
