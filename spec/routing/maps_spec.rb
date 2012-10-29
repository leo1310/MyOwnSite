require 'spec_helper'

describe MapsController do	
	describe "routing" do
		it "routes to #map_view" do
			get("/map_view/MyMap").should route_to("maps#map_view", :name=>'MyMap')
		end
		
		it "routes to #add_description_country" do
			get("/world_countries").should route_to("maps#add_description_country")
		end
		
		it "routes to #add_description_capital" do
			get("/world_capitals").should route_to("maps#add_description_capital")
		end

		it "routes to #country" do
			get("/country/Country_name").should route_to("maps#country", :country_name=>'Country_name')
		end

		it "routes to #capital" do
			get("/capital/Capital_name").should route_to("maps#capital", :capital_name=>'Capital_name')
		end

		it "routes to #city" do
			get("/city/City_name").should route_to("maps#city", :city_name=>'City_name')
		end
	end
end