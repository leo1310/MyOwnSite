class SpamWord < ActiveRecord::Base
  attr_accessible :word

  validates :word, :presence => true 
  validates :word, :uniqueness => true
end