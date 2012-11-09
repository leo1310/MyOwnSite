require 'spec_helper'

describe ProfilesController do
	describe "Messages routing" do
		it "routes to #messages_inbox" do
			get("/messages_inbox").should route_to("profiles#messages_inbox")
		end
		
		it "routes to #messages_sent" do
			get("/messages_sent").should route_to("profiles#messages_sent")
		end
		
		it "routes to #messages_spam" do
			get("/messages_spam").should route_to("profiles#messages_spam")
		end
		
		it "routes to #send_message_in_profile" do
			get("/send_message_in_profile").should route_to("profiles#send_message_in_profile")
		end
	end
	describe "About me routing" do
		it "routes to #my_information" do
			get("/my_information").should route_to("profiles#my_information")
		end

		it "routes to #my_contacts" do
			get("/my_contacts").should route_to("profiles#my_contacts")
		end

		it "routes to #interests" do
			get("/interests").should route_to("profiles#interests")
		end

		it "routes to #secondary_education" do
			get("/secondary_education").should route_to("profiles#secondary_education")
		end

		it "routes to #higher_education" do
			get("/higher_education").should route_to("profiles#higher_education")
		end

		it "routes to #courses" do
			get("/courses").should route_to("profiles#courses")
		end

		it "routes to #trainings" do
			get("/trainings").should route_to("profiles#trainings")
		end

		it "routes to #career" do
			get("/career").should route_to("profiles#career")
		end

		it "routes to #life_position" do
			get("/life_position").should route_to("profiles#life_position")
		end
	end

	describe "About me update routing" do
		it "routes to #update_my_information" do
			get("/update_my_information").should route_to("profiles#update_my_information")
		end

		it "routes to #update_my_contacts" do
			get("/update_my_contacts").should route_to("profiles#update_my_contacts")
		end

		it "routes to #update_my_interests" do
			get("/update_my_interests").should route_to("profiles#update_my_interests")
		end

		it "routes to #update_secondary_education" do
			get("/update_secondary_education").should route_to("profiles#update_secondary_education")
		end

		it "routes to #update_higher_education" do
			get("/update_higher_education").should route_to("profiles#update_higher_education")
		end

		it "routes to #update_course" do
			get("/update_course").should route_to("profiles#update_course")
		end

		it "routes to #update_trainings" do
			get("/update_trainings").should route_to("profiles#update_training")
		end

		it "routes to #update_career" do
			get("/update_career").should route_to("profiles#update_career")
		end
	end
end