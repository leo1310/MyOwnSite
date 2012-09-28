class SessionsController < Devise::SessionsController
	def destroy
		@user = User.find(current_user.id)
		@user.time_logout = Time.now
		@user.count_time_logout += 1
		@user.save
		super		
	end
end