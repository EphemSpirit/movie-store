class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre, :rating, :release_date
  belongs_to :director
end
