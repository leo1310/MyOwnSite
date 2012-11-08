class CreateFotos < ActiveRecord::Migration  
  def up
    create_table :fotos, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :album_foto_id
      t.text :description
      t.attachment :foto     
      t.timestamps
    end
  end
  def down
  	drop_table :fotos  	
  end
end
