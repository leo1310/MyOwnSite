class AddNewColumnToTableInterests < ActiveRecord::Migration
  def up
  	add_column :interests, :favorite_sport_i, :string
  end
  def down
  	remove_column :interests, :favorite_sport_i
  end
end
