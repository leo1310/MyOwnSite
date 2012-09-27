class CreateCareers < ActiveRecord::Migration  
  def up
    create_table :careers do |t|
  		t.integer :user_id
    	t.string :country
	    t.string :town
    	t.string :name_work    	
    	t.date :start_year
    	t.date :end_year
    	t.string :position
    	t.string :obligations
    	t.timestamps
    end  
  end

  def down
  	drop_table :careers
  end
end
