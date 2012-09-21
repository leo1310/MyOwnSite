class CreateCourses < ActiveRecord::Migration  
  def up
    create_table :courses do |t|
    t.integer :user_id
    t.string :country
    t.string :town
    t.string :name_course
    t.date :year
    t.string :description    
    t.string :narrator_course
    t.timestamps
    end
  end
  def down
  	drop_table :courses
  end
end
