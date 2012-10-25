class Career < ActiveRecord::Base
   attr_accessible :user_id, :country, :town, :name_work, :start_year, :end_year, :position, :obligations

   belongs_to :user
end
