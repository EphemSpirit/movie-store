class CastMemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :trivia_fact, :birthday, :birth_city
  has_many :movies, through: :castings
end
