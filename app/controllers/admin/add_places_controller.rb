class Admin::AddPlacesController < ApplicationController
	before_filter :authenticate_admin!
	def index
		@tab_index_menu = 4
	end
end