class AlbumFoto < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :title_foto

  validates :title, :uniqueness => {:scope => :user_id}
  validates :title, :presence => true

  has_many :fotos, :dependent => :destroy
  belongs_to :user
end
