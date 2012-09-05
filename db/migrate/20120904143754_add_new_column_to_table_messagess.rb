class AddNewColumnToTableMessagess < ActiveRecord::Migration
  def up
  	add_column :messages, :deleted_sender, :string, :default => "true"
  	add_column :messages, :deleted_geter, :string, :default => "true"
  end
  def down
  	remove_column :messages, :deleted_sender
  	remove_column :messages, :deleted_geter
  end
end
