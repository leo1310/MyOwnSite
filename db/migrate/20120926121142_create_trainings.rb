class CreateTrainings < ActiveRecord::Migration  
  def up
    create_table :trainings, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer :user_id
    t.string :country
    t.string :town
    t.string :name_institution    
    t.string :name_training
    t.date :year
    t.string :description    
    t.string :narrator_course
    t.timestamps
    end
  end
  def down
  	drop_table :trainings
  end
end
