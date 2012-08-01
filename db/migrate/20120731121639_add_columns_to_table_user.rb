class AddColumnsToTableUser < ActiveRecord::Migration
  def up
  	add_column :users, :name ,:string
  	add_column :users, :last_name ,:string
  	add_column :users, :phone ,:string
  end
  def down
  	remove :users, :name
  	remove :users, :last_name
  	remove :users, :phone
  end
end
