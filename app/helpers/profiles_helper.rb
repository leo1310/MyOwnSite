module ProfilesHelper

	def get_countries
		@str = 'Select country,'
		@all_countries = Country.find(:all, :order=>"country")
		if not @all_countries.nil?
			@arr_countries_name = @str
			@arr_countries_name += @all_countries.map { |c| c.country }.join ','
			@arr_countries_name += ',Other'

			return @countries_name = @arr_countries_name.split(",")
		end
	end

	def random_friend(count)
		array_randome_friends = []
		@index = 0
		10.times{
			@tmp = Random.rand(1...count)
			array_randome_friends[@index] = @tmp
			@index += 1
		}
		array_randome_friends.sort!
		@index = 0
		9.times{
			if array_randome_friends[@index].eql?(array_randome_friends[@index+1])
				array_randome_friends[@index+1] = array_randome_friends[@index+1]+1
			elsif (array_randome_friends[@index] > array_randome_friends[@index+1])
				array_randome_friends[@index+1] = array_randome_friends[@index+1] + (array_randome_friends[@index] - array_randome_friends[@index+1])+1
			end
			@index += 1
		}

		return array_randome_friends
	end
end
