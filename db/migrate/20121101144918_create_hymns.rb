class CreateHymns < ActiveRecord::Migration
  def up
    create_table :hymns, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :country_id
      t.string :content_type
      t.string :filename
      t.binary :binary_data, :limit => 5.megabyte

      t.timestamps
    end
  end
  def down
  	drop_table :hymns  	
  end
end
