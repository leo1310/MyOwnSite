class AddNewColumnsToTableUsersToday < ActiveRecord::Migration
  def up
    add_column :users, :surname, :string
    add_column :users, :birthday, :date
    add_column :users, :marital_status, :string 
  end

  def down
    remove_column :users, :surname
    remove_column :users, :birthday
    remove_column :users, :marital_status
  end
end
