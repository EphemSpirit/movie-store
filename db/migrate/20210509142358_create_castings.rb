class CreateCastings < ActiveRecord::Migration[6.0]
  def change
    create_table :castings do |t|
      t.integer :movie_id
      t.integer :cast_member_id

      t.timestamps
    end
  end
end
