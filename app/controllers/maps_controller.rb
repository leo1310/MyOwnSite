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

	def add_description_city
		@city = City.find(params[:id])
	end

	def country
		@country = Country.find_by_country(params[:country_name])
		@cities = @country.cities.all
	end

	def capital
		@capital = Capital.find_by_name(params[:capital_name])
	end
	
end
