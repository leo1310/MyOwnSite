class PagesController < ApplicationController
	before_filter :authenticate_user!	
	layout 'page'
	
	def index
		@user = User.find(current_user.id)
		@tab_index_main_menu = 1		
	end		
	
	def about
		@tab_index_main_menu = 5		
	end

	def help
		@tab_index_main_menu = 6		
	end

	def search
		@tab_index_main_menu = 7		
	end

	def status_active	
		unless current_user.nil?
			@user = User.find(current_user.id)
			@user.status_active = Time.now
			@user.save
			render :text => "" 		
		end	
	end	
end
