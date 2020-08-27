class AddAlbumToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :album, :string
  end
end
