class AddNewColumnToTableAlbumFoto < ActiveRecord::Migration
  def up
  	add_column :album_fotos, :title_foto, :integer
  end
  def down
  	remove_column :album_fotos, :title_foto
  end
end
