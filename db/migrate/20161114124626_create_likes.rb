class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end
    #add_reference :likes, :user, index: true, foreign_key: true
    #add_reference :likes, :picture, index: true, foreign_key: true
    add_index :likes, [:user_id, :user_id], unique: true
  end
end
