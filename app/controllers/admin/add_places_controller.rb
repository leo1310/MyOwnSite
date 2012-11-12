class Admin::AddPlacesController < ApplicationController
	before_filter :authenticate_admin!
	include ProfilesHelper	
	
	def add_hymn
		@tab_index_menu = 4
		@tab_content_index = 1

		@countries = get_countries()
		unless @countries.blank?
			@countries_name = @countries
		else
			@countries_name = [""]
		end

		@hymns = Hymn.all
	end

	def attachment_data
		if not params[:hymn][:country_id].eql?('empty') and not params[:hymn][:attachment].nil?
			@country = Country.find_by_country(params[:hymn][:country_id])							

	        @attachment = Hymn.new        
	        @attachment.uploaded_file(params[:hymn][:attachment], @country.id)        

	        if @attachment.save
	            flash[:success] = "Thank you for your submission..."
	            redirect_to :controller => 'admin/add_places', :action => "add_hymn"
	        else
	            flash[:error] = "There was a problem submitting your attachment."
	            redirect_to :controller => 'admin/add_places', :action => "add_hymn"
	        end
	    else
	    	flash[:error] = "There was a problem submitting your attachment."
	    	redirect_to :controller => 'admin/add_places', :action => "add_hymn"
	    end
	end

	def download_hymn
		@hymn = Hymn.find(params[:id])
    	send_data @hymn.binary_data, :type=>@hymn.content_type, :disposition => 'attachment', :filename => @hymn.filename
	end

	def delete_hymn
		@hymn = Hymn.find(params[:id])
		if @hymn.destroy
			flash[:success] = "National Hymn one of the country was deleted"
			redirect_to :controller => 'admin/add_places', :action => "add_hymn"
		else
			flash[:error] = "There was a problem delete National Hymn one of the country"
			redirect_to :controller => 'admin/add_places', :action => "add_hymn"
		end
	end	

	def add_word_spam
		@tab_index_menu = 4
		@tab_content_index = 2

		@spam_words = SpamWord.all
	end

	def add_word
		if not params[:spam_word][:word].nil? and not params[:spam_word][:word].eql?('')
			@spam_word = SpamWord.create(params[:spam_word])
			if @spam_word.save
				flash[:success] = "The word was added"
				redirect_to :controller => 'admin/add_places', :action => "add_word_spam"
			else
				flash[:error] = "There was a problem add word to Data Base"
				redirect_to :controller => 'admin/add_places', :action => "add_word_spam"
			end
		else
			flash[:error] = "There was a problem add word to Data Base"
			redirect_to :controller => 'admin/add_places', :action => "add_word_spam"
		end
	end

	def delete_word
		@word = SpamWord.find(params[:id])
		if @word.destroy
			flash[:success] = "The word was deleted"
			redirect_to :controller => 'admin/add_places', :action => "add_word_spam"
		else
			flash[:error] = "There was a problem delete word from Data Base"
			redirect_to :controller => 'admin/add_places', :action => "add_word_spam"
		end
	end
end