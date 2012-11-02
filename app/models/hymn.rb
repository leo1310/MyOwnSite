class Hymn < ActiveRecord::Base
  attr_accessible :filename
  validates :country_id, :presence => true
  validates :country_id, :uniqueness => true

   
    def uploaded_file(incoming_file, country_id)
    	self.country_id = country_id
        self.filename = incoming_file.original_filename
        self.content_type = incoming_file.content_type
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
