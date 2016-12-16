class DefaultValueOnLikesCountToPictures < ActiveRecord::Migration[5.0]
  def change
    change_column_default :pictures, :likes_count, 0
  end
end
