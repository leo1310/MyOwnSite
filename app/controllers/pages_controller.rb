class PagesController < ApplicationController
	before_filter :authenticate_user!
	layout 'page'
	
	def index
		@user = User.find(current_user.id)		
	end
	def profile
		@user = User.find(current_user.id)		
	end
	def message
	end
	
end
