class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :event_type
      t.string :details

      t.timestamps
    end

  end
end
