class ProfilesController < ApplicationController
	before_filter :authenticate_user!
	layout 'page'
	
	def about_me
		@tab_index = 2
	end

	def my_page
		@tab_index = 1
	end

	def foto
		@tab_index = 3
	end

	def friends
		@tab_index = 4
	end

	def messages_friends
		@tab_index = 5
	end
	def my_settings
		@tab_index = 6		
	end

	def towns
		@tab_index = 7
	end

	def messages_inbox
		@message_tab_index = 1
	end

	def messages_sent
		@message_tab_index = 2
	end

	def messages_spam
		@message_tab_index = 3
	end
end
