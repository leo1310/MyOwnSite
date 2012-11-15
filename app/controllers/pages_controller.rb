class PagesController < ApplicationController
	before_filter :authenticate_user!	
	layout 'page'
	
	def index
		@user = User.find(current_user.id)
		@tab_index_main_menu = 1		
	end		
	
	def about
		@tab_index_main_menu = 5		
	end

	def help
		@tab_index_main_menu = 6		
	end

	def search
		@tab_index_main_menu = 7

		@users_find = User.all(:limit=>20)		
	end

	def status_active	
		unless current_user.nil?
			@user = User.find(current_user.id)
			@user.status_active = Time.now
			@user.save			
			render :text => ""			 		
		end	
	end	

	def search_user
		@search = params[:search]		

		if not @search.include? " "
			@users_find = User.all
			unless @search.eql?(" ")
				@users_tmp = []
				@users_tmp += @users_find.select {|item| item.name.downcase.include? @search}				
				
				if @users_tmp.count.eql?(0)
					@users_tmp += @users_find.select {|item| item.last_name.downcase.include? @search}
				end

				@users_find = @users_tmp
			end
		else
			@users_find = User.all
			unless @search.eql?("")			
				@array = @search.split(" ")
				@name = @array[0]
				@last_name = @array[@array.count-1]				
				
				@users_tmp =[]
				@users_tmp += @users_find.select {|item| item.name.downcase.include? @name and item.last_name.downcase.include? @last_name}

				if @users_tmp.count.eql?(0)
					@users_tmp += @users_find.select {|item| item.name.downcase.include? @last_name and item.last_name.downcase.include? @name}				
				end

				@users_find = @users_tmp			
			end
		end
	end
end
