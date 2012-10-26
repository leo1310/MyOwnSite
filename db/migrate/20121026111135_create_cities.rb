class CreateCities < ActiveRecord::Migration  
  def up
    create_table :cities, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
		    t.integer :part_of_the_world_id
        t.integer :country_id
        t.string :city
        t.text :description
        t.string :X_coordinate
  	    t.string :Y_coordinate
  	    t.integer :zoom
      	t.timestamps
    end
  end

  def down
  	drop_table :cities
  end
end
