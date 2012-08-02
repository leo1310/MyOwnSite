class AddNewColumnsInThreeTables < ActiveRecord::Migration
  def up
  	add_column :part_of_the_worlds, :X_coordinate, :string
  	add_column :part_of_the_worlds, :Y_coordinate, :string
  	add_column :part_of_the_worlds, :zoom, :integer  	
  	add_column :countries, :X_coordinate, :string
  	add_column :countries, :Y_coordinate, :string
  	add_column :countries, :zoom, :integer  	
  	add_column :capitals, :X_coordinate, :string
  	add_column :capitals, :Y_coordinate, :string
  	add_column :capitals, :zoom, :integer  	
  end

  def down
  	remove_column :part_of_the_worlds, :X_coordinate
  	remove_column :part_of_the_worlds, :Y_coordinate
  	remove_column :part_of_the_worlds, :zoom
  	remove_column :countries, :X_coordinate
  	remove_column :countries, :Y_coordinate
  	remove_column :countries, :zoom
  	remove_column :capitals, :X_coordinate
  	remove_column :capitals, :Y_coordinate
  	remove_column :capitals, :zoom
  end
end
