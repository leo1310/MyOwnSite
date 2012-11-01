class Country < ActiveRecord::Base
  attr_accessible :id, :part_of_the_world_id, :country, :description, :X_coordinate, :Y_coordinate, :zoom

  validates :country, :uniqueness => true
  validates :part_of_the_world_id, :country, :X_coordinate, :Y_coordinate, :zoom, :presence => true 

  belongs_to :part_of_the_world
  has_one :capital
  has_one :hymn
  has_many :cities
end
