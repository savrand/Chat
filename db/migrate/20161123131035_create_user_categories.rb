class CreateUserCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_categories do |t|
      t.string :user_id
      t.string :integer
      t.string :category_id
      t.string :integer

      t.timestamps
    end
    add_index :user_categories, [:user_id, :category_id], unique: true
  end
end
