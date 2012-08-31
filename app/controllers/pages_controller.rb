class PagesController < ApplicationController
	before_filter :authenticate_user!
	layout 'page'
	
	def index
		@user = User.find(current_user.id)
		@tab_index_main_menu = 1		
	end
	def profile
		@user = User.find(current_user.id)		
	end
	
	def message
	end
	
	def about
		@tab_index_main_menu = 5		
	end

	def help
		@tab_index_main_menu = 6		
	end
	
end
