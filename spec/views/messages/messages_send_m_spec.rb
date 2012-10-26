require 'spec_helper'

#describe MessagesController do	
	describe "messages/send_m.html.erb" do
		before do
    		message = Message.new(who_send_mail: "James", who_get_mail: 'Hylio')
    		assign :message, message 
    		render
  		end
		it 'displays a form to create a page' do
			rendered.should have_selector('form', :id => 'new_message', :method => 'post',:action => '/messages') do |form|
		      form.should have_selector('input', :type => 'submit')
    		end
		end		
	end
#end