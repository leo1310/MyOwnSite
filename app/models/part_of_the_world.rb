class PartOfTheWorld < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :countries
  has_many :capitals
end
