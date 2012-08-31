class Admin::SettingsController < ApplicationController
	before_filter :authenticate_admin!
	def index
		@tab_index_menu = 5
	end
end