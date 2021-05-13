class ChangeTitleInMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :title, :name
  end
end
