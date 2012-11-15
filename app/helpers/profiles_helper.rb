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

	def search_friends(_search, user)
		if not _search.include? " "
			@friends = user.friends.find_all_by_query_to_friends(1)
			unless _search.eql?(" ")
				@friends_tmp =[]
				@friends_tmp += @friends.select {|item| (User.find(item.friend)).name.downcase.include? _search}

				if @friends_tmp.count.eql?(0)
					@friends_tmp += @friends.select {|item| (User.find(item.friend)).last_name.downcase.include? _search}
				end

				return @friends = @friends_tmp							
			end
		else			
			@friends = user.friends.find_all_by_query_to_friends(1)
			unless _search.eql?("")			
				@array = _search.split(" ")
				@name = @array[0]
				@last_name = @array[@array.count-1]				
				
				@friends_tmp =[]
				@friends_tmp += @friends.select {|item| (User.find(item.friend)).name.downcase.include? @name and (User.find(item.friend)).last_name.downcase.include? @last_name}

				if @friends_tmp.count.eql?(0)
					@friends_tmp += @friends.select {|item| (User.find(item.friend)).name.downcase.include? @last_name and (User.find(item.friend)).last_name.downcase.include? @name}				
				end

				return @friends = @friends_tmp				
			end
		end
	end

end
