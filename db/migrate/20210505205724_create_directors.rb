class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :years_active
      t.integer :movie_id

      t.timestamps
    end
  end
end
