class CreateSecondaryEducations < ActiveRecord::Migration
  def up
    create_table :secondary_educations do |t|
    t.integer :user_id
    t.string :country
    t.string :town
    t.string :school
    t.date :start_year
    t.date :end_year
    t.string :specialization    		  
    t.timestamps
    end
  end
  def down
  	drop_table :secondary_educations
  end
end
