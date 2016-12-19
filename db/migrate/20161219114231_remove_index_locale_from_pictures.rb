class RemoveIndexLocaleFromPictures < ActiveRecord::Migration[5.0]
  def change
    remove_index :pictures, name: :index_pictures_on_location
  end
end
