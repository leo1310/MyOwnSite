class AddNewColumnToTableMessages2 < ActiveRecord::Migration
  def up
  	add_column :messages, :spam, :integer
  end
  def down
  	remove_column :messages, :spam
  end
end
