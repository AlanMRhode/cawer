class ProfilesController < ApplicationController
	def update
		puts "***********************"
		puts current_user.profile
		puts "***********************"
		@update = params[:form_fields]
		@current_user.profile.update(@update)
		redirect_to user_path
	end
end
