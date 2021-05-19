class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_many :comments, as: :commentable
  belongs_to :user
end
