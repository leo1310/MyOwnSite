require 'spec_helper'

#describe MessagesController do	
	describe "profiles/show.html.erb" do
			  
	  	before(:each) do
	      @request.env["devise.mapping"] = Devise.mappings[:user]
	      @user = Factory.create(:user)	     
	      #sign_in @user
	      visit user_session_url	      
	      fill_in 'user_email', with: @user.email
  		  fill_in 'user_password', with: @user.password
  		  click_button "Sign in"  		  
	    end
		it 'displays a form to create a page' do							      
			#visit send_url
			#page.should have_content "Надіслати нове повідомлення"
			render
			#rendered.should have_selector('form', :id => 'new_message', :method => 'post',:action => '/messages') do |form|
		    #  form.should have_selector('input', :type => 'submit')
    		#end
		end	  		
	end
#end