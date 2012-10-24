require 'spec_helper'

describe MessagesController do	
	describe "routing" do
		it "routes to #sent" do
			get("/sent").should route_to("messages#sent")
		end
		
		it "routes to #input" do
			get("/input").should route_to("messages#input")
		end
		
		it "routes to #send" do
			get("/send").should route_to("messages#send_m")
		end

		it "routes to #message_status" do
			get("/messages/message_status").should route_to("messages#message_status")
		end
		
		it "routes to #delete_message" do
			get("/messages/delete_message").should route_to("messages#delete_message")
		end
		
		it "routes to #delete_message_sent" do
			get("/messages/delete_message_sent").should route_to("messages#delete_message_sent")
		end

		it "routes to #delete_group_messages" do
			get("/messages/delete_group_messages").should route_to("messages#delete_group_messages")
		end
		
		it "routes to #delete_group_messages_sent" do
			get("/messages/delete_group_messages_sent").should route_to("messages#delete_group_messages_sent")
		end
	end
end