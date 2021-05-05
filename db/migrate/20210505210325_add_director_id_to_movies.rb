class AddDirectorIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :director_id, :integer
  end
end
