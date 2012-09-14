class AddNewColumnsToTableContacts < ActiveRecord::Migration
  def up
  	add_column :contacts, :country, :string
  	add_column :contacts, :town, :string
  	add_column :contacts, :house, :string
  	add_column :contacts, :own_site, :string
  	
  end

  def down  	
  	remove_column :contacts, :country
  	remove_column :contacts, :town
  	remove_column :contacts, :house
  	remove_column :contacts, :own_site  	
  end
end
