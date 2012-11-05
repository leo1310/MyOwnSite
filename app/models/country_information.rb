class CountryInformation < ActiveRecord::Base
  # attr_accessible :title, :body
   validates :country_id, :uniqueness => true
end
