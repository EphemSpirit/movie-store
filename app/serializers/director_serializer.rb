class DirectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :years_active
  has_many :movies
end
