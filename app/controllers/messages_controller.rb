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

		@read_status = @user.messages.where(:read_message => 'not_read', :who_get_mail => ''+@user.nik_name)
		@read_status_count = @read_status.count
		
		@messages = Message.find_all_by_who_get_mail(@user.nik_name)	
		
	end	

	def sent
		@tab_index = 3
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
	
end
