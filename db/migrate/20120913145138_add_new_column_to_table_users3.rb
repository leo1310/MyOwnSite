class AddNewColumnToTableUsers3 < ActiveRecord::Migration
  def up
  	add_column :users, :native_town, :string
  end

  def down
  	remove_column :users, :native_town
  end
end
