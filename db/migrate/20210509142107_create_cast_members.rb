class CreateCastMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :cast_members do |t|
      t.string :name
      t.integer :age
      t.string :trivia_fact
      t.date :birthday
      t.string :birth_city

      t.timestamps
    end
  end
end
