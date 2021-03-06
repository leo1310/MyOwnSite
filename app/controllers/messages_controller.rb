class MessagesController < ApplicationController
before_filter :authenticate_user!
before_filter :load_index
layout 'page'

	def send_m
		@tab_index_messages = 1
		@user = User.find(current_user.id)
	end	

	def input
		@index = 1
		@tab_index_messages = 2
		
		@user = User.find(current_user.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 25).find_all_by_who_get_mail_and_deleted_geter(@user.nik_name, 'true')		
		
		@messages_count = Message.find_all_by_who_get_mail_and_deleted_geter(@user.nik_name, 'true')		
		@read_status_count = 0
		@messages_count.each do |message|
			if message.read_message.eql?('not_read')
				@read_status_count += 1
			end
		end
		
		@admins = Admin.all		
	end	

	def sent
		@tab_index_messages = 3
		@index = 1
		@user = User.find(current_user.id)
		@messages = @user.messages.paginate(:page => params[:page], :per_page => 25).find_all_by_deleted_sender('true')
	end

	def create
		@user = User.find(params[:id])					
		@users = User.all
		@admins = Admin.all
		
		@counter = 0
		@counter2 = 0
	
		@users.each do |user|
			if user.nik_name.eql?(params[:message][:who_get_mail])
				@counter2 = 1
				break
			else
				@counter2 = 0
			end
		end

		
		if @counter2 == 0			
			@admins.each do |admin|
				if admin.nik_name.eql?(params[:message][:who_get_mail])
					@counter = 1
					break
				else
					@counter = 0
				end
			end
		end		

		if @counter == 1 or @counter2 == 1
			@user.messages.create(params[:message])
			@user.save
			flash[:success] = "Your message sent to the recipient."
		else
			flash[:error] = "Error sending. No such nick."
		end

		redirect_to :controller => "messages", :action => "send_m"
	end

	def message_status
		@message = Message.find(params[:id])
		@message.read_message = "read"
		@message.save
		render :text => ""
	end

	def load_index
		@tab_index_main_menu = 4		
	end

	def delete_message
		@user = User.find(current_user.id)
		@message = @user.messages.find(params[:id])
		@message.deleted_geter = "false"
		@message.save

		redirect_to :controller=>"profiles", :action=>"messages_inbox"					
	end

	def delete_message_sent
		@user = User.find(current_user.id)
		@message = @user.messages.find(params[:id])
		@message.deleted_sender = "false"
		@message.save

		redirect_to :controller=>"profiles", :action=>"messages_sent"					
	end


	def delete_group_messages
		@user = User.find(current_user.id)
		@i = 0
		while params[:arr] != nil do
			
			@message = Message.find(params[:arr][@i])
			@message.deleted_geter = "false"
			@message.save
			@i += 1
			
		end

		redirect_to :controller=>"profiles", :action=>"messages_inbox"
					
	end

	def delete_group_messages_sent
		@user = User.find(current_user.id)
		@i = 0
		while params[:arr] != nil do
			
			@message = @user.messages.find(params[:arr][@i])
			@message.deleted_sender = "false"
			@message.save
			@i += 1
			puts "XXXXXXXXXXXXX"*3
		end

		redirect_to :controller=>"profiles", :action=>"messages_sent"
					
	end	
	
end
