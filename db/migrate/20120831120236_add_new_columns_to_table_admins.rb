class AddNewColumnsToTableAdmins < ActiveRecord::Migration
  def up
  	add_column :admins, :first_name, :string
  	add_column :admins, :last_name, :string
  	add_column :admins, :nik_name, :string
  end

  def down
  	remove_column :admins, :first_name
  	remove_column :admins, :last_name
  	remove_column :admins, :nik_name
  end
end
