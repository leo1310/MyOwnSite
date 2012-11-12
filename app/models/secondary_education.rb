class SecondaryEducation < ActiveRecord::Base
   attr_accessible :user_id, :country, :town, :school, :start_year, :end_year, :specialization

   validates :school, :presence => true

   belongs_to :user
end
