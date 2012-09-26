class AddNewColumnToTableCourses < ActiveRecord::Migration
  def up
  	add_column :courses, :year_end, :date
  	add_column :courses, :name_institution, :string
  end

  def down
  	remove_column :courses, :year_end
  	remove_column :courses, :name_institution
  end
end
