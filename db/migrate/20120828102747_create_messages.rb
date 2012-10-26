class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
		t.string :who_send_mail
		t.string :who_get_mail
    	t.string :subject
    	t.text :description
      t.timestamps
    end
  end
  def down
  	drop_table :messages
  end
end
