class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :location
      t.integer :user_id

      t.timestamps
    end

    add_index :pictures, :location, unique: true
    #add_reference :pictures, :user, index: true, foreign_key: true
  end
end
