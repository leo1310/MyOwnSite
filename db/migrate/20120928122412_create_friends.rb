class CreateFriends < ActiveRecord::Migration
  def up
    create_table :friends do |t|
		t.integer :user_id
		t.integer :friend
      	t.timestamps
    end
  end
  def down
  	drop_table :friends
  end
end
