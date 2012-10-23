class Country < ActiveRecord::Base
  attr_accessible :id, :part_of_the_world_id, :country, :description, :X_coordinate, :Y_coordinate, :zoom

  validates :country, :uniqueness => true

  belongs_to :part_of_the_world
end
