class Course < ActiveRecord::Base
  attr_accessible :user_id, :country, :town, :name_course, :year, :description, :narrator_course

  belongs_to :user
end
