class AddNewTableSpamWords < ActiveRecord::Migration
  def up
    create_table :spam_words do |t|  		
    	t.string :word	    
    	t.timestamps
    end  
  end

  def down
  	drop_table :spam_words
  end
end
