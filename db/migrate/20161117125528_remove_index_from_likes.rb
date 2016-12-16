class RemoveIndexFromLikes < ActiveRecord::Migration[5.0]
  def change
    remove_index :likes, name: :index_likes_on_user_id_and_user_id
  end
end
