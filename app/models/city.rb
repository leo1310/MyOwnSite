class City < ActiveRecord::Base
  attr_accessible :part_of_the_world_id, :country_id, :city, :description, :X_coordinate, :Y_coordinate, :zoom

  belongs_to :part_of_the_world
  belongs_to :country
end
