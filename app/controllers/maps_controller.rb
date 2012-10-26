class MapsController < ApplicationController
before_filter :authenticate_user!
layout 'page'

	def map_view
		@part_of_the_world = PartOfTheWorld.find_by_title(params[:name])
		@countries = @part_of_the_world.countries.find(:all, :order=>"country")
		@capitals = @part_of_the_world.capitals.find(:all, :order=>"name")
	end

	def add_description_country	
		@country = Country.find(params[:id])
	end
	
	def add_description_capital
		@capital = Capital.find(params[:id])
	end

	def country
		@country = Country.find_by_country(params[:country_name])
	end

	def capital
		@capital = Capital.find_by_name(params[:capital_name])
	end

	def search
		puts "hhhhhhhhhhh"*3				

		@country = Country.find_by_country(params[:input_text])
		unless @country.nil?
			redirect_to :controller => "maps", :action => "country", :country_name=> params[:input_text]
		else
			@capital = Capital.find_by_name(params[:input_text])
			unless @capital.nil?
				redirect_to :controller => "maps", :action => "capital", :capital_name=> params[:input_text]
			else
				@city = City.find_by_city(params[:input_text])
				unless @city.nil?
					redirect_to :controller => "maps", :action => "city", :city_name=> params[:input_text]
				else
					flash[:error] = "Your text not found."
				end
			end
		end 
	end
end
