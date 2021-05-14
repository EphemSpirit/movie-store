class RemoveMovieIdFromDirectors < ActiveRecord::Migration[6.0]
  def change
    remove_column :directors, :movie_id, :integer
  end
end
