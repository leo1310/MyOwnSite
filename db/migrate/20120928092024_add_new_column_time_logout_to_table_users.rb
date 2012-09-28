class AddNewColumnTimeLogoutToTableUsers < ActiveRecord::Migration
  def up
  	add_column :users, :time_logout, :datetime
  end
  def down
  	remove_column :users, :time_logout
  end
end
