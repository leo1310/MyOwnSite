class Admin::MyInformationsController < ApplicationController
	before_filter :authenticate_admin!
	before_filter :load_index
	
	def foto
		@tab_information_index = 1

		@admin = Admin.find(current_admin.id)
	end

	def load_index
		@tab_index_menu = 6
	end

	def update_avatar
		@admin = Admin.find(current_admin.id)
		if @admin.update_attributes(params[:admin])
        	flash[:success] = "Your profile is update!"
        	redirect_to :controller => "admin/my_informations", :action => "foto"
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :controller => "admin/my_informations", :action => "foto"
    	end
		
	end
end