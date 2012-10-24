require 'spec_helper'

describe PagesController do	
	describe "routing" do
		it "routes to #index" do
			get("/").should route_to("pages#index")
		end
		
		it "routes to #about" do
			get("/about").should route_to("pages#about")
		end
		
		it "routes to #help" do
			get("/help").should route_to("pages#help")
		end

		it "routes to #aboutSite" do
			get("/aboutSite").should route_to("pages#about_site")
		end
		
		it "routes to #partners" do
			get("/partners").should route_to("pages#partners")
		end
		
		it "routes to #authors" do
			get("/authors").should route_to("pages#authors")
		end

		it "routes to #contacts" do
			get("/contacts").should route_to("pages#contacts")
		end
		
		it "routes to #search" do
			get("/search").should route_to("pages#search")
		end
		
		it "routes to #additionalInf" do
			get("/additionalInf").should route_to("pages#additionalInf")
		end

		it "routes to #status_active" do
			get("/pages/status_active").should route_to("pages#status_active")
		end	
	end
end