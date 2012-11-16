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
		@countries = Country.all(:order=>'country ASC')		
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

	def show_cities_country
		if params[:country_id].eql?('0')
			@users_find = User.all(:limit=>20)
		else
			@country = Country.find(params[:country_id])
			@capital = Capital.find_by_country_id(@country.id)			
			@cities = []
			@cities[0] = @capital
			@cities += @country.cities.all(:order=>'city ASC')
			
			
			@users = User.all
			@users_tmp = []
			@users_find = []
			@users_tmp += @users.select{|item| item.contact != nil }
			@users_find += @users_tmp.select{|item| item.contact.country.include? @country.country}
		end
	end

	def show_users_city		
		if params[:country_id].nil?
			@city = City.find(params[:city_id])
			@country = Country.find(@city.country_id)

			@users = User.all
			@users_tmp = []
			@users_find = []
			@users_tmp += @users.select{|item| item.contact != nil }
			@users_find += @users_tmp.select{|item| item.contact.country.include? @country.country and item.contact.town.include? @city.city}

		else
			@country = Country.find(params[:country_id])

			@users = User.all
			@users_tmp = []
			@users_find = []
			@users_tmp += @users.select{|item| item.contact != nil }
			@users_find += @users_tmp.select{|item| item.contact.country.include? @country.country}
		end
	end

	def show_users_capital
		@capital = Capital.find(params[:capital_id])
		@country = Country.find(@capital.country_id)				
		
		@users = User.all
		@users_tmp = []
		@users_find = []
		@users_tmp += @users.select{|item| item.contact != nil }
		@users_find += @users_tmp.select{|item| item.contact.country.include? @country.country and item.contact.town.include? @capital.name}
	end
end
