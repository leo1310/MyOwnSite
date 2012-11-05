class Foto < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :album_foto

    def uploaded_file(incoming_file, album_id, description)    	
    	self.album_foto_id = album_id
        self.filename = incoming_file.original_filename
        self.content_type = incoming_file.content_type
        self.description = description
        self.binary_data = incoming_file.read
    end

    def filename=(new_filename)
        write_attribute("filename", sanitize_filename(new_filename))
    end

    private
    def sanitize_filename(filename)
        #get only the filename, not the whole path (from IE)
        just_filename = File.basename(filename)
        #replace all non-alphanumeric, underscore or periods with underscores
        just_filename.gsub(/[^\w\.\-]/, '_')
    end
end
