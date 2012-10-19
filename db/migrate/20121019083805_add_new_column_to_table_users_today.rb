class AddNewColumnToTableUsersToday < ActiveRecord::Migration
  def up
  	add_column :users, :status_active, :datetime
  end
  def down
  	remove_column :users, :status_active
  end
end
