class RenameColumnInTableCountries < ActiveRecord::Migration
  def up
  	rename_column :countries, :partOfTheWorld_id, :part_of_the_world_id
  end

  def down
  	rename_column :countries, :part_of_the_world_id, :partOfTheWorld_id 
  end
end
