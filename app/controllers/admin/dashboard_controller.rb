class Admin::DashboardController < ApplicationController	
	before_filter :authenticate_admin!
	#layout 'admin'  
	
	def index
		@tab_index_menu = 1
	end
end