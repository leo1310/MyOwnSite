class AddNewColumnToTableUsers2 < ActiveRecord::Migration
  def up
  	add_column :users, :stat, :string
  end

  def down
  	remove_column :users, :stat
  end
end
