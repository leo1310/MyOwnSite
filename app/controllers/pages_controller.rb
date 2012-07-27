class PagesController < ApplicationController
	def about
		@zones = ActiveSupport::TimeZone.all.map(&:name)

	end
end
