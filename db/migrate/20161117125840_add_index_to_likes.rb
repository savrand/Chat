class AddIndexToLikes < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, [:user_id, :picture_id], unique: true
  end
end
