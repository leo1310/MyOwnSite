class Capital < ActiveRecord::Base
  attr_accessible :part_of_the_world_id, :country_id, :name, :description, :X_coordinate, :Y_coordinate, :zoom
  
  validates :name, :uniqueness => true

  belongs_to :part_of_the_world
end
