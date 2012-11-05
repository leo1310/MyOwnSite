class MapsController < ApplicationController
before_filter :authenticate_user!
layout 'page'

	def map_view
		@part_of_the_world = PartOfTheWorld.find_by_title(params[:name])
		@countries = @part_of_the_world.countries.find(:all, :order=>"country")
		@capitals = @part_of_the_world.capitals.find(:all, :order=>"name")
		@cities = @part_of_the_world.cities.find(:all, :order=>"city")
	end

	def about_country	
		@country = Country.find(params[:id])
	end
	
	def about_capital
		@capital = Capital.find(params[:id])
	end

	def about_city
		@city = City.find(params[:id])
	end

	def add_description_city
		@city = City.find(params[:id])
	end

	def country
		@country = Country.find_by_country(params[:country_name])
		@cities = @country.cities.all
		@capital = Capital.find_by_country_id(@country.id)
		@country_information = CountryInformation.find_by_country_id(@country.id)
	end

	def capital
		@capital = Capital.find_by_name(params[:capital_name])
	end

	def city
		@city = City.find_by_city(params[:city_name])
	end	

	def download_hymn
		@hymn = Hymn.find_by_country_id(params[:id])
    	send_data @hymn.binary_data, :type => "audio/mp3", :disposition => "inline", :filename=>@hymn.filename
	end
end
