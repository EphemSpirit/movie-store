class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :make_wishlist

  has_many :comments, dependent: :destroy
  has_many :likes
  has_one :wishlist, dependent: :destroy

  def make_wishlist
    Wishlist.create(user_id: self.id)
  end
end
