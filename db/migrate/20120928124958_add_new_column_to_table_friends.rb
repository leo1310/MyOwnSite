class AddNewColumnToTableFriends < ActiveRecord::Migration
  def up
  	add_column :friends, :query_to_friends, :integer
  end
  def down
  	remove_column :friends, :query_to_friends
  end
end
