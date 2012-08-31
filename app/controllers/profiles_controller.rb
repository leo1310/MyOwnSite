class ProfilesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_index
	layout 'page'
	
	def about_me
		@tab_index_profile_menu = 2
	end

	def my_page
		@tab_index_profile_menu = 1
	end

	def foto
		@tab_index_profile_menu = 3
	end

	def friends
		@tab_index_profile_menu = 4
	end
	
	def my_settings
		@tab_index_profile_menu = 6		
	end

	def towns
		@tab_index_profile_menu = 7
	end

	def messages_inbox
		@tab_index_profile_message_menu = 1
		@tab_index_profile_menu = 5
	end

	def messages_sent
		@tab_index_profile_message_menu = 2
		@tab_index_profile_menu = 5
	end

	def messages_spam
		@tab_index_profile_message_menu = 3
		@tab_index_profile_menu = 5
	end

	def load_index
		@tab_index_main_menu = 2		
	end
end
