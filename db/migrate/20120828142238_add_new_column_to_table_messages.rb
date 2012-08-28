class AddNewColumnToTableMessages < ActiveRecord::Migration
  def up
  	add_column :messages, :read_message, :string
  end

  def down
  	remove_column :messages, :read_message
  end
end
