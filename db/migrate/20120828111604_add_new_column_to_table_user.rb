class AddNewColumnToTableUser < ActiveRecord::Migration
  def up
  	add_column :users, :nik_name, :string
  end

  def down
  	remove_column :users, :nik_name
  end
end
