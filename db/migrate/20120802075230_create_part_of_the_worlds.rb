class CreatePartOfTheWorlds < ActiveRecord::Migration
  def up
    create_table :part_of_the_worlds, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    	t.string :title    	
    	t.text :description
      t.timestamps
    end
  end
  def down
  	drop_table :part_of_the_worlds
  end
end
