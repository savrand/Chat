class AddUnlockTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unlock_token, :string
  end
end
