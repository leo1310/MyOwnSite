class Admin::MessagesController < ApplicationController
	before_filter :authenticate_admin!
	def index
	end

	def inbox
		@tab_index_menu = 3
		@tab_message_index = 1
		@index = 1
		
		@admin = Admin.find(current_admin.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 20).find_all_by_who_get_mail_and_deleted_geter(@admin.nik_name, 'true')	


		@messages_count = Message.find_all_by_who_get_mail(@admin.nik_name)		
		@read_status_count = 0
		@messages_count.each do |message|
			if message.read_message.eql?('not_read')
				@read_status_count += 1
			end
		end

		@admins = Admin.all	
	end

	def sent
		@tab_index_menu = 3
		@tab_message_index = 2
		@index = 1
		@admin = Admin.find(current_admin.id)
		@messages = Message.paginate(:page => params[:page], :per_page => 20).find_all_by_who_send_mail_and_deleted_sender(@admin.nik_name, 'true')
	end

	def send_m
		@tab_index_menu = 3
		@tab_message_index = 3
		@admin = Admin.find(current_admin.id)
	end

	def create
		@admin = Admin.find(params[:id])	
		@users = User.all
		@admins = Admin.all
		
		@counter = 0
		@counter2 = 0
	
		@arr_user = @users.select{|u| u[:nik_name].eql?(params[:message][:who_get_mail])}
		unless @arr_user.empty?
			@counter = 1
		else
			@counter = 0
		end

		if @counter == 0			
			@arr_admin = @admins.select{|a| a[:nik_name].eql?(params[:message][:who_get_mail])}
			unless @arr_admin.empty?
				@counter2 = 1
			else
				@counter2 = 0
			end
		end		

		if @counter == 1 or @counter2 == 1
			Message.create(params[:message])	
			flash[:success] = "Your message sent to the recipient"
		else
			flash[:error] = "Error sending"
		end

		redirect_to :controller => "messages", :action => "send_m"
	end

	def delete_inbox_message	
		@message = Message.find(params[:id])
		@message.deleted_geter = "false"
		@message.save

		redirect_to :controller=>"admin/messages", :action=>"inbox"
	end

	def delete_sent_message	
		@message = Message.find(params[:id])
		@message.deleted_sender = "false"
		@message.save

		redirect_to :controller=>"admin/messages", :action=>"sent"
	end

end