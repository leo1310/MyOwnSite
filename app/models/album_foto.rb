class AlbumFoto < ActiveRecord::Base
  attr_accessible :title, :description, :user_id

  validates :title, :uniqueness => {:scope => :user_id}

  has_many :fotos
end
