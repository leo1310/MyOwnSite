class Admin::UsersController < ApplicationController
	before_filter :authenticate_admin!
	
	def index
		@tab_index_menu = 2

		@users = User.all
	end
end