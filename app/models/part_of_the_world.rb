class PartOfTheWorld < ActiveRecord::Base
  attr_accessible :id, :title, :description, :X_coordinate, :Y_coordinate, :zoom

  validates :title, :uniqueness => true

  has_many :countries
  has_many :capitals
end
