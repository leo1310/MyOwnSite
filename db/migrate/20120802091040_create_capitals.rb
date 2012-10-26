class CreateCapitals < ActiveRecord::Migration
  def change
    create_table :capitals, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    	t.integer :part_of_the_world_id
      t.integer :country_id
    	t.string :name
    	t.text :description
      t.timestamps
    end
  end
  def down
  	drop_table :capitals
  end
end
