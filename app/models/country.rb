class Country < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :part_of_the_world
end
