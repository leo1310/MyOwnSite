class ProfilesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_index
	layout 'page'
	
	def about_me
		@tab_index_profile_menu = 2
	end

	def my_page
		@tab_index_profile_menu = 1
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

	def messages_inbox
		@tab_index_profile_message_menu = 1
		@tab_index_profile_menu = 5

		@admins = Admin.all		
		@user = User.find(current_user.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 25).find_all_by_who_get_mail_and_deleted_geter(@user.nik_name, 'true')		
		
	end

	def messages_sent
		@tab_index_profile_message_menu = 2
		@tab_index_profile_menu = 5
	end

	def messages_spam
		@tab_index_profile_message_menu = 3
		@tab_index_profile_menu = 5
	end

	def load_index
		@tab_index_main_menu = 2		

		@user = User.find(current_user.id)
		@messages_count = Message.find_all_by_who_get_mail_and_deleted_geter(@user.nik_name, 'true')		
		@new_message = 0
		@messages_count.each do |message|
			if message.read_message.eql?('not_read')
				@new_message += 1
			end
		end	
		
	end

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
end
