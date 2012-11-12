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
	
	#----------	Checking On Spam -----------------------	
	def check_message_on_spam(user)

		@spams = SpamWord.all

		@checking_messages = Message.find_all_by_who_get_mail_and_spam(user.nik_name, nil)
		@checking_messages.each do |message|
			unless message.subject.nil?				
				@spams.each do |spam|				
					if message.subject.downcase.include? spam.word
						message.spam = 1
						message.save
						break
					end					
				end				
			end

			if not message.description.nil? and not message.spam == 1
				@spams.each do |spam|				
					if message.description.downcase.include? spam.word
						message.spam = 1
						message.save
						break
					end
				end
				if message.spam.nil?			
					message.spam = 0
					message.save
				end
			end
		end
	end
end
