class MessagesController < ApplicationController
before_filter :authenticate_user!


	def send_m
		@tab_index = 1
		@user = User.find(current_user.id)
	end	

	def input
		@index = 1
		@tab_index = 2
		@user = User.find(current_user.id)
		@messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 25).find_all_by_who_get_mail(@user.nik_name)		
		
		@messages_count = Message.find_all_by_who_get_mail(@user.nik_name)		
		@read_status_count = 0
		@messages_count.each do |message|
			if message.read_message.eql?('not_read')
				@read_status_count += 1
			end
		end		
	end	

	def sent
		@tab_index = 3
		@index = 1
		@user = User.find(current_user.id)
		@messages = @user.messages.paginate(:page => params[:page], :per_page => 25)
	end

	def create
		@user = User.find(params[:id])					
		@user_recipient = User.find_by_nik_name(params[:message][:who_get_mail])		
		unless @user_recipient.blank?
			@user.messages.create(params[:message])
			@user.save
			flash[:success] = "Your message sent to the recipient"
		else
			flash[:error] = "Error sending"
		end

		redirect_to :controller => "messages", :action => "send_m"
	end

	def message_status
		@message = Message.find(params[:id])
		@message.read_message = "read"
		@message.save
		render :text => ""
	end
	
end
