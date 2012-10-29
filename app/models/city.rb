class City < ActiveRecord::Base
  attr_accessible :part_of_the_world_id, :country_id, :city, :description, :X_coordinate, :Y_coordinate, :zoom

  validates :part_of_the_world_id, :country_id, :city, :X_coordinate, :Y_coordinate, :zoom, :presence => true
  validates :city, :uniqueness => true

  belongs_to :part_of_the_world
  belongs_to :country
end
