class CreateCountries < ActiveRecord::Migration
  def up
    create_table :countries, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    	t.integer :part_of_the_world_id
    	t.string :country
    	t.text :description    	
      t.timestamps
    end
  end
  def down
  	drop_table :countries
  end
end
