class SecondaryEducation < ActiveRecord::Base
   attr_accessible :user_id, :country, :town, :school, :start_year, :end_year, :specialization 

   belongs_to :user
end
