module ProfilesHelper

	def get_countries
		@all_countries = Country.find(:all, :order=>"country")
		if not @all_countries.nil?
			@arr_countries_name = @all_countries.map { |c| c.country }.join ','
			@arr_countries_name += ',Other'
			return @countries_name = @arr_countries_name.split(",")
		end
	end
end
