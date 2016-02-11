class SessionsController < ApplicationController
	def create
		puts params[:user]
		@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			puts "*******************"
			puts session[:user_id]
			puts "*******************"
			redirect_to home_path current_user
		else
			flash[:notice] = 'Incorrect Username/Password. Please try again.'
			redirect_to (:back)
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
