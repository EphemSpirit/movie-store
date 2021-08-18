class AddWishlistIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :wishlist_id, :integer
  end
end
