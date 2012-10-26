class CreateHigherEducations < ActiveRecord::Migration
  def up
    create_table :higher_educations, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer :user_id
    t.string :country
    t.string :town
    t.string :high_school
    t.string :faculty
    t.string :department
    t.string :status
    t.date :start_year
    t.date :end_year
    t.string :specialization    		  
    t.timestamps
    end
  end
  def down
  	drop_table :higher_educations
  end
end
