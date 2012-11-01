class Admin::AddPlacesController < ApplicationController
	before_filter :authenticate_admin!
	include ProfilesHelper	
	def index
		@tab_index_menu = 4

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end

	def attachment_data
		@country = Country.find_by_country(params[:hymn][:country_id])				
		return if params[:hymn][:attachment].blank?

        @attachment = Hymn.new        
        @attachment.uploaded_file(params[:hymn][:attachment], @country.id)        

        if @attachment.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :controller => 'admin/add_places', :action => "index"
        else
            flash[:error] = "There was a problem submitting your attachment."
            redirect_to :controller => 'admin/add_places', :action => "index"
        end

	end
end