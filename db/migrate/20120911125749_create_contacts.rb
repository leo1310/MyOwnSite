class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
    	t.integer :user_id
    	t.string :skype_c
    	t.string :icq_c    	
    	t.string :twitter_c
    	t.string :facebook_c
    	t.string :google_plus_c
    	t.string :vkontakte_c
    	t.string :email_c
      t.timestamps
    end
  end
  def down
  	drop_table :contacts
  end
end
