class Training < ActiveRecord::Base
  attr_accessible  :user_id, :country, :town, :name_institution, :name_training, :year, :description, :narrator_course

   validates :name_training, :presence => true
  
  belongs_to :user
end
