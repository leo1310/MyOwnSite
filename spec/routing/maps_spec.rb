require 'spec_helper'

describe MapsController do	
	describe "routing" do
		it "routes to #map_view" do
			get("/map_view/MyMap").should route_to("maps#map_view", :name=>'MyMap')
		end
		
		it "routes to #about_country" do
			get("/about_country").should route_to("maps#about_country")
		end
		
		it "routes to #about_capital" do
			get("/about_capital").should route_to("maps#about_capital")
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

		it "routes to #about_city" do
			get("/about_city").should route_to("maps#about_city")
		end

		it "routes to #add_description_city" do
			get("/world_cities").should route_to("maps#add_description_city")
		end

		it "routes to #download_hymn" do
			get("/download_hymn/2").should route_to("maps#download_hymn", :id=>'2')
		end
	end
end