class CreateAlbumFotos < ActiveRecord::Migration
  def up
    create_table :album_fotos, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
  def down
  	drop_table :album_fotos
  end
end
