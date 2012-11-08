class AlbumFoto < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :title_foto

  validates :title, :uniqueness => {:scope => :user_id}

  has_many :fotos, :dependent => :destroy
end
