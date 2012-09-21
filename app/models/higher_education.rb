class HigherEducation < ActiveRecord::Base
  attr_accessible :user_id, :country, :town, :high_school, :faculty, :department, :status, :start_year, :end_year, :specialization

  belongs_to :user
end
