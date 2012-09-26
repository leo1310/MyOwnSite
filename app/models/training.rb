class Training < ActiveRecord::Base
  attr_accessible  :user_id, :country, :town, :name_institution, :name_training, :year, :description, :narrator_course
  
  belongs_to :user
end
