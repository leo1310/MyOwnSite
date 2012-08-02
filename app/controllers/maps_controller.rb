class MapsController < ApplicationController
before_filter :authenticate_user!

	def africa
		@part_of_the_world = PartOfTheWorld.find(1)
		@countries = @part_of_the_world.countries
		@capitals = @part_of_the_world.capitals
	end

	def add_description_africa_country	
		@country = Country.find(params[:id])
	end
	
	def add_description_africa_capital
		@capital = Capital.find(params[:id])
	end

	def europa
		@part_of_the_world = PartOfTheWorld.find(2)
		@countries = @part_of_the_world.countries
		@capitals = @part_of_the_world.capitals
	end

end
