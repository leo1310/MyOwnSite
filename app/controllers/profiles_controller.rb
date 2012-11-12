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
		@user = User.find(params[:id])		

		if @user.count_time_logout < @user.sign_in_count
			@time = true
		else
			@time = false
		end

		unless @user.status_active.nil?
			if (Time.now-@user.status_active) < 60
				@active = true
			else
				@active = false
				unless @user.status_active.nil?
					@time_logout = @user.status_active
				else
					@time_logout = @user.current_sign_in_at
				end			
			end
		else
			@active = false
			unless @user.time_logout.nil?
				@time_logout = @user.time_logout
			else
				@time_logout = @user.current_sign_in_at
			end
		end
		
		@contact = @user.contact
		@interest = @user.interest
		
		@secondary_educations = @user.secondary_educations
		@higher_educations = @user.higher_educations
		@courses = @user.courses
		@trainings = @user.trainings
		@careers = @user.careers
		@friend = Friend.find_by_user_id_and_friend(current_user.id, @user.id)
		@friend_two = Friend.find_by_user_id_and_friend(@user.id, current_user.id)
		@friends = Friend.find_all_by_user_id(@user.id, :order=>'created_at DESC')	

		unless @friends.blank?
			@friends_count = @friends.count			
		else
			@friends_count = 0
		end

		@online_users = 0
		
		@fotos_count = 0		
		@albums = AlbumFoto.find_all_by_user_id(@user.id)
		@albums.each do |album|
			@fotos = Foto.find_all_by_album_foto_id(album.id)
			@fotos_count += @fotos.count
		end
		
		@album = @albums.last
		unless @album.nil?
			@fotos_on_my_page = Foto.find_all_by_album_foto_id(@album.id, :order=>'created_at DESC')
		end

	end

	# ----------------------Friends actions-------------------------------------
	
	def query_to_add_friend
		@user = User.find(current_user.id)
		@user.friends.create(:friend=>params[:id], :query_to_friends => 0)
		@user_friend = User.find(params[:id])

		flash[:success] = @user_friend.last_name + " " + @user_friend.name + " Get your request that add you to friends!"
		redirect_to profile_path(params[:id])		
	end

	def delete_friend
		@friend = Friend.find_by_user_id_and_friend(current_user.id, params[:id])
		@friend.destroy

		@friend = Friend.find_by_user_id_and_friend(params[:id], current_user.id)
		@friend.destroy

		@user_friend = User.find(params[:id])
		flash[:success] = @user_friend.last_name + " " + @user_friend.name + " Was deleted from your friends!"
		
		if params[:user_id].nil?  
		  redirect_to friends_all_path
		elsif not params[:user_id].nil?
		  redirect_to profile_path(params[:user_id])
		end		
	end

	def friends_online
		@tab_index_profile_friends_menu = 2
		@tab_index_profile_menu = 4

		@user = User.find(params[:id])

		@friends = @user.friends.find_all_by_query_to_friends(1)
		@online_users = 0
	end

	def friends_all
		@tab_index_profile_friends_menu = 3
		@tab_index_profile_menu = 4

		@user = User.find(params[:id])

		@friends = @user.friends.paginate(:page => params[:page], :per_page => 25).find_all_by_query_to_friends(1)
	end

	def friends_query_to
		@tab_index_profile_friends_menu = 4
		@tab_index_profile_menu = 4

		@user = User.find(current_user.id)

		@friends = @user.friends.paginate(:page => params[:page], :per_page => 25).find_all_by_query_to_friends(0)		
	end
	
	def delete_friend_query_to
		@friend = Friend.find(params[:id])
		@friend.destroy

		redirect_to friends_query_to_path
	end

	def friends_query_in
		@user = User.find(current_user.id)

		@friends = Friend.paginate(:page => params[:page], :per_page => 25).find_all_by_friend_and_query_to_friends(current_user.id, 0)

		@tab_index_profile_friends_menu = 1
		@tab_index_profile_menu = 4
	end

	def add_friend
		@friend = Friend.find(params[:id])
		@friend.query_to_friends = 1
		@friend.save

		@user = User.find(current_user.id)
		@user.friends.create(:friend=>@friend.user_id, :query_to_friends => 1)
		
		@user_friend = User.find(@friend.user_id)
		flash[:success] = @user_friend.last_name + " " + @user_friend.name + " Was added to your friends!"
		
		if params[:user_id].nil?  
		  redirect_to friends_query_in_path
		elsif not params[:user_id].nil?
		  redirect_to profile_path(params[:user_id])
		end
	end

	# ----------------------Settings actions-------------------------------------
	
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
        	redirect_to :controller => "profiles", :action => "foto_avatar"
    	else  
        	flash[:error] = "Error! Your profile is not update!"
        	redirect_to :controller => "profiles", :action => "foto_avatar"
    	end		
	end

	def foto_avatar
		 @tab_index_profile_foto_menu = 1
		 @tab_index_profile_menu = 3
	end
	def foto_albums
		@tab_index_profile_foto_menu = 2
		@tab_index_profile_menu = 3

		@user = User.find(params[:id])
		@str = 'Select Album,'
		@albums = AlbumFoto.find_all_by_user_id(@user.id, :order=>"created_at DESC")		
		@all_albums = AlbumFoto.find_all_by_user_id(current_user.id, :order=>"title")		
		if not @all_albums.nil?
			@arr_albums_name = @str
			@arr_albums_name += @all_albums.map { |c| c.title }.join ','			

			@albums_name = @arr_albums_name.split(",")
		end

		unless @albums.blank?
			@count_albums = @albums.count
		else
			@count_albums = 0
		end
	end

	def create_album
		unless current_user.nil?
			@album = AlbumFoto.new
			@album.user_id = current_user.id
			@album.title = params[:title]
			@album.description = params[:description]		
			if @album.save
				@answer = 1
				#render :text => ""
			else
				@answer = 0
				#render :text => ""
			end
		end		
	end
	
	def get_album_name
		@album = AlbumFoto.find_by_title_and_user_id(params[:album_name],current_user.id)
		@fotos = Foto.find_all_by_album_foto_id(@album.id)		
	end

	def edit_album		
		@album = AlbumFoto.find(params[:album_id])
		if @album.update_attributes(params[:album_foto])
        	flash[:success] = "Your album is update!"
        	redirect_to :controller => "profiles", :action => "foto_albums", :id=> current_user.id
    	else  
        	flash[:error] = "Error! Your album is not update!"
        	redirect_to :controller => "profiles", :action => "foto_albums", :id=> current_user.id
    	end
	end

	def delete_album
		@album = AlbumFoto.find(params[:album_id])
		@fotos = Foto.find_all_by_album_foto_id(@album.id)

		if @fotos.count.eql?(0)
			if @album.destroy
				flash[:success] = "Your Album was deleted."
	        	redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
	        else
	        	flash[:error] = "Error delete Album."
	        	redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
	        end
		else
			flash[:error] = "Move foto to other Album and try again."
	        redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
		end
	end

	def add_foto
		if not params[:foto][:album_foto_id].eql?('Select Album') and not params[:foto][:foto].nil?
			@album = AlbumFoto.find_by_title_and_user_id(params[:foto][:album_foto_id],current_user.id)
	        
	        @foto = Foto.create(params[:foto])

	        if @foto.save	        	
	        	@foto.album_foto_id = @album.id
	        	@foto.save
	            flash[:success] = "Your foto was loaded. You can see it in the album."
	            redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
	        else
	            flash[:error] = "There was a problem load your file."
	    		redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
	        end
	    else
	    	flash[:error] = "There was a problem load your file."
	    	redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
	    end
	end

	def foto_edit
		@albums = AlbumFoto.find_all_by_user_id(current_user.id, :order=>"title")
		@album = AlbumFoto.find_by_title_and_user_id(params[:album_name], current_user.id)
		@fotos = Foto.find_all_by_album_foto_id(@album.id)
	end

	def delete_foto
		@foto = Foto.find(params[:id])
		@album = AlbumFoto.find(@foto.album_foto_id)
		if @album.title_foto.eql?(@foto.id)
		    @album.title_foto = nil
		    @album.save
		end
		
		if @foto.destroy
			flash[:success] = "Your Foto was deleted."
	        redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
		else
			flash[:error] = "There was a problem delete your foto."
	    	redirect_to :controller => 'profiles', :action => "foto_albums", :id=> current_user.id
		end
	end

	def move_foto
		@id = params[:id]
		@foto = Foto.find(@id)
		@new_album = AlbumFoto.find_by_title_and_user_id(params[:new_album_name], current_user.id)	
		@old_album = AlbumFoto.find_by_title_and_user_id(params[:old_album_name], current_user.id)		
		
		if @old_album.title_foto.eql?(@foto.id)
		    @old_album.title_foto = nil
		    @old_album.save
		end

		unless @new_album.nil?
			unless @foto.nil?
				@foto.album_foto_id = @new_album.id
				if @foto.save
					@answer = 1
				else
					@answer = 0
				end
			end
		end
	end

	def display_foto
		@album = AlbumFoto.find_by_title_and_user_id(params[:album_name], params[:user_id])
		unless @album.nil?  
			@fotos = Foto.find_all_by_album_foto_id(@album.id)
		end
	end
	
	# ----------------------Other actions-------------------------------------
	def load_index
		@tab_index_main_menu = 2		

		@user = User.find(current_user.id)
		check_message_on_spam(@user)
		
		@messages_count = Message.find_all_by_who_get_mail_and_deleted_geter_and_read_message_and_spam(@user.nik_name, 'true', 'not_read', 0)
		@new_message = @messages_count.count
		@messages_count_spam = Message.find_all_by_who_get_mail_and_deleted_geter_and_read_message_and_spam(@user.nik_name, 'true', 'not_read', 1)		
		@new_message_spam = @messages_count_spam.count
		
		@friends = Friend.find_all_by_friend_and_query_to_friends(@user.id, 0)
		@new_query_to_friends = @friends.count
	end
end
