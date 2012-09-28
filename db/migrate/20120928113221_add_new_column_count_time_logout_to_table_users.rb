class AddNewColumnCountTimeLogoutToTableUsers < ActiveRecord::Migration
  def up
  	add_column :users, :count_time_logout, :integer, :default => 0
  end
  def down
  	remove_column :users, :count_time_logout
  end
end
