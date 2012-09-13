class AddNewColumnToTableUsers4 < ActiveRecord::Migration
  def up
  	add_column :users, :birthday_show_hide_date, :string
  	
  end

  def down
  	remove_column :users, :birthday_show_hide_date
  	
  end
end
