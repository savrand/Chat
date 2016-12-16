class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end

    #add_reference :comments, :user, index: true, foreign_key: true
    #add_reference :comments, :picture, index: true, foreign_key: true
  end
end
