class AddCategoryToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :category_id, :integer
    #add_reference :pictures, :category, index: true, foreign_key: true
  end
end
