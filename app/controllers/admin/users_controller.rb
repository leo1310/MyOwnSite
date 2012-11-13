class Admin::UsersController < ApplicationController
	before_filter :authenticate_admin!
	
	def show_user_info
		@tab_index_menu = 2

		@from = params[:timerange][:from] if not params[:timerange].nil?
    	@to = params[:timerange][:to] if not params[:timerange].nil? 

		if params[:find].nil? and params[:timerange].nil?
			@users = User.all
		elsif not params[:find].nil?
			@search = params[:find][:word_search]
			@users = User.find_all_by_name(@search)
			@asociation = 11
			
			if @users.count.eql?(0)
				@users = User.find_all_by_last_name(@search)
				@asociation = 1
			end
			
			if @users.count.eql?(0)
				@users = User.find_all_by_surname(@search)
				@asociation = 2
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_nik_name(@search)
				@asociation = 3
			end			

			if @users.count.eql?(0)
				@users = User.find_all_by_stat(@search)
				@asociation = 4
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_native_town(@search)
				@asociation = 5
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_email(@search)
				if @users.count.eql?(0)
					@array = User.all
					@users += @array.select {|item| item.email.include? @search }
				end
				@asociation = 6
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_marital_status(@search)
				@asociation = 7
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_current_sign_in_ip(@search)
				@asociation = 8
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_last_sign_in_ip(@search)
				@asociation = 8
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_phone(@search)
				if @users.count.eql?(0)
					@array = User.all
					@users += @array.select {|item| item.phone.include? @search }
				end
				@asociation = 9
			end

			if @users.count.eql?(0)
				@users = User.find_all_by_birthday(@search)	
				@asociation = 10			
			end

			if @users.count.eql?(0)				
				@asociation = 0			
			end

			@message = 1	
		elsif not params[:timerange].nil?
			
			if params[:timerange][:from].eql?("")
	           	@fromdate = Time.now.beginning_of_day
      		else
    	       	@fromdate = params[:timerange][:from].to_date.to_time.beginning_of_day
      		end

		    if params[:timerange][:to].eql?("")
		        @todate = Time.now.end_of_day
		    else    
		        @todate =  params[:timerange][:to].to_date.to_time.end_of_day
		    end
		    
		    @users = User.where(:status_active => @fromdate..@todate)
		    
		    if params[:timerange][:from].eql?("") && params[:timerange][:to].eql?("")
		       @users = User.all
		    end

      		@message = 2
		end
	end
end