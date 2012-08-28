class AddNewColumnToTableUser2 < ActiveRecord::Migration
  def up
  	add_column :messages, :user_id, :integer
  end

  def down
  	remove_column :messages, :user_id
  end
end
