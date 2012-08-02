class CreatePartOfTheWorlds < ActiveRecord::Migration
  def up
    create_table :part_of_the_worlds do |t|
    	t.string :title    	
    	t.text :description
      t.timestamps
    end
  end
  def down
  	drop_table :part_of_the_worlds
  end
end
