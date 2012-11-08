class Foto < ActiveRecord::Base
  attr_accessible :album_foto_id, :description

  validates_attachment :foto, :presence => true,  :content_type => {:content_type => /image/}, :size => { :in => 0..10.megabytes }

belongs_to :album_foto

attr_accessible :foto
has_attached_file :foto, :styles => { :medium => "600x600", :thumb => "128x128", :little => "64x64", :very_little => "48x48" }
    
end
