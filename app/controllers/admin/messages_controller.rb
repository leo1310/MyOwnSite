class Admin::MessagesController < ApplicationController
	before_filter :authenticate_admin!
	def index
	end

	def inbox
		@tab_index_menu = 3
		@tab_message_index = 1
		@index = 1
		
		@admin = Admin.find(current_admin.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 20).find_all_by_who_get_mail(@admin.nik_name)	


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
		@messages = Message.paginate(:page => params[:page], :per_page => 20).find_all_by_who_send_mail(@admin.nik_name)
	end

	def send_m
		@tab_index_menu = 3
		@tab_message_index = 3
		@admin = Admin.find(current_admin.id)
	end

	def create
		@admin = Admin.find(params[:id])					
		@user_recipient = User.find_by_nik_name(params[:message][:who_get_mail])		
		@admin = Admin.find_by_nik_name(params[:message][:who_get_mail])		
		unless @user_recipient.blank? and @admin.blank?
			Message.create(params[:message])			
			flash[:success] = "Your message sent to the recipient"
		else
			flash[:error] = "Error sending"
		end

		redirect_to :controller => "messages", :action => "send_m"

	end

end