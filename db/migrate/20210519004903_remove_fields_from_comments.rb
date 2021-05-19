class RemoveFieldsFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id, :integer
    remove_column :comments, :movie_id, :integer
  end
end
