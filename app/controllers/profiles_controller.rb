class ProfilesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_index
	layout 'page'
	include ProfilesHelper
	
	# ----------------------About me actions-------------------------------------
	def my_information
		@user = User.find(current_user.id)

		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 1
	end

	def update_my_information
		@user = User.find(current_user.id)
    	if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "my_information"  
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "my_information"   
    	end
	end

	def my_contacts
		@user = User.find(current_user.id)
		if @user.contact.nil?			
			@contact = Contact.new
		else
			@contact = @user.contact
		end

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
		
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 2
	end
	
	def update_my_contacts
		@user = User.find(current_user.id)	
		
		if @user.contact.nil?			
			
			@contact = Contact.new(params[:contact])			
			@contact.save

			flash[:success] = "Your profile is updated!"
        	redirect_to :action => "my_contacts"  
		else
			if @user.contact.update_attributes(params[:contact])
        		flash[:success] = "Your profile is updated!"
        		redirect_to :action => "my_contacts"  
    		else  
        		flash[:error] = "Error! Your profile is not update!"
        		redirect_to :action => "my_contacts"   
    		end
		end
	end

	def interests
		@user = User.find(current_user.id)
		if @user.interest.nil?			
			@interest = Interest.new
		else
			@interest = @user.interest
		end

		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 3
	end

	def update_my_interests
		@user = User.find(current_user.id)

		if @user.interest.nil?			
			
			@interest = Interest.new(params[:interest])			
			@interest.save

			flash[:success] = "Your profile is updated!"
        	redirect_to :action => "interests"  
		else
			if @user.interest.update_attributes(params[:interest])
        		flash[:success] = "Your profile is updated!"
        		redirect_to :action => "interests"  
    		else  
        		flash[:error] = "Error! Your profile is not update!"
        		redirect_to :action => "interests"   
    		end
		end
	end

	# ----------------------Education-------------------------------------
	def secondary_education
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 4
		@tab_index_education = 1

		@user = User.find(current_user.id)		

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end
	
	def update_secondary_education

		@user = User.find(current_user.id)

		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "secondary_education" 
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "secondary_education" 
    	end
	end

	def higher_education		
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 4
		@tab_index_education = 2

		@user = User.find(current_user.id)

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end

	def update_higher_education		
		@user = User.find(current_user.id)

		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "higher_education" 
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "higher_education" 
    	end
	end

	def courses
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 4
		@tab_index_education = 3

		@user = User.find(current_user.id)

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end

	def update_course
		@user = User.find(current_user.id)

		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "courses" 
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "courses" 
    	end
	end
	
	def trainings
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 4
		@tab_index_education = 4

		@user = User.find(current_user.id)

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end
	
	def update_training
		@user = User.find(current_user.id)

		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "trainings" 
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "trainings" 
    	end
	end


	def career
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 5

		@user = User.find(current_user.id)

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end
	end

	def update_career
		@user = User.find(current_user.id)

		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is updated!"
        	redirect_to :action => "career" 
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :action => "career" 
    	end
	end

	def life_position
		@tab_index_profile_menu = 2
		@tab_index_profile_about_me = 6
	end
	
	# ----------------------My Page actions-------------------------------------
	def show
		@tab_index_profile_menu = 1
		@user = User.find(current_user.id)
		@contact = @user.contact
		@interest = @user.interest
		
		@secondary_educations = @user.secondary_educations
		@higher_educations = @user.higher_educations
		@courses = @user.courses
		@trainings = @user.trainings
		@careers = @user.careers

	end

	def foto
		@tab_index_profile_menu = 3
		@user = User.find(current_user.id)
	end

	def friends
		@tab_index_profile_menu = 4
	end
	
	def my_settings
		@tab_index_profile_menu = 6		
	end

	def towns
		@tab_index_profile_menu = 7
	end

	# ----------------------Messages actions-------------------------------------
	def messages_inbox
		@tab_index_profile_message_menu = 1
		@tab_index_profile_menu = 5
		@user = User.find(current_user.id)

		#----------	Checking On Spam -----------------------
		@spams = SpamWord.all

		@checking_messages = Message.find_all_by_who_get_mail_and_spam(@user.nik_name, nil)
		@checking_messages.each do |message|
			unless message.subject.nil?				
				@spams.each do |spam|				
					if message.subject.downcase.include? spam.word
						message.spam = 1
						message.save
						break
					end					
				end				
			end

			if not message.description.nil? and not message.spam == 1
				@spams.each do |spam|				
					if message.description.downcase.include? spam.word
						message.spam = 1
						message.save
						break
					end
				end
				if message.spam.nil?			
					message.spam = 0
					message.save
				end
			end
		end


		@admins = Admin.all		
		
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 25).find_all_by_who_get_mail_and_deleted_geter_and_spam(@user.nik_name, 'true', 0)		
		@messages_count = @messages.count		
	end

	def messages_sent
		@tab_index_profile_message_menu = 2
		@tab_index_profile_menu = 5

		@admins = Admin.all		
		@user = User.find(current_user.id)		
	    @messages = @user.messages.paginate(:page => params[:page], :per_page => 25).find_all_by_deleted_sender('true')
	    @messages_count = @messages.count
	end

	def send_message_in_profile
		@user = User.find(params[:id])					
		@user_recipient = User.find_by_nik_name(params[:message][:who_get_mail])		
		@admin = Admin.find_by_nik_name(params[:message][:who_get_mail])		
		unless @user_recipient.blank? and @admin.blank?
			@user.messages.create(params[:message])
			@user.save
			flash[:success] = "Your message sent to the recipient"
		else
			flash[:error] = "Error sending"
		end

		redirect_to :controller => "profiles", :action => "messages_inbox"
	end

	def messages_spam
		@tab_index_profile_message_menu = 3
		@tab_index_profile_menu = 5

		@admins = Admin.all		
		@user = User.find(current_user.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 25).find_all_by_who_get_mail_and_deleted_geter_and_spam(@user.nik_name, 'true', 1)		
		@messages_count = @messages.count
	end	
	
	# ----------------------Foto actions-------------------------------------
	def update_avatar
		@user = User.find(current_user.id)
		if @user.update_attributes(params[:user])
        	flash[:success] = "Your profile is update!"
        	redirect_to :controller => "profiles", :action => "foto"
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :controller => "profiles", :action => "foto"
    	end
		
	end

	def load_index
		@tab_index_main_menu = 2		

		@user = User.find(current_user.id)
		@messages_count = Message.find_all_by_who_get_mail_and_deleted_geter(@user.nik_name, 'true')		
		@new_message = 0
		@new_message_spam = 0
		@messages_count.each do |message|
			if message.read_message.eql?('not_read') and message.spam == 0
				@new_message += 1
			end
			if message.read_message.eql?('not_read') and message.spam == 1
				@new_message_spam += 1
			end
		end
		
	end
end
