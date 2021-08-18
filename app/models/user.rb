class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :make_wishlist

  has_many :comments
  has_many :likes
  has_one :wishlist
  #has_many :selected_movies, through: :wishlist, class_name: "Movie", source: :movie

  def make_wishlist
    Wishlist.create(user_id: self.id)
  end
end
