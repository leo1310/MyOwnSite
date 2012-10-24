require 'spec_helper'

describe MapsController do	
	describe "routing" do
		it "routes to #map_view" do
			get("/map_view").should route_to("maps#map_view")
		end
		
		it "routes to #add_description_country" do
			get("/world_countries").should route_to("maps#add_description_country")
		end
		
		it "routes to #add_description_capital" do
			get("/world_capitals").should route_to("maps#add_description_capital")
		end
	end
end