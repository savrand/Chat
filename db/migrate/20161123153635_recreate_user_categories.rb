class RecreateUserCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_categories do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :user_categories, [:user_id, :category_id], unique: true
  end
end
