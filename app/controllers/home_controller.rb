class HomeController < ApplicationController
	layout "main"

	def index
		@comment = Comment.new
		@user = User.new
	end

	def home
		current_user
		@comment = Comment.new
		@user = User.new
		@post = Post.new
		@current_user_followers = @current_user.followers_posts.reverse.each
	end

	def globalcaws
		current_user
		@comment = Comment.new
		@user = User.new
		@post = Post.new
	end
	
	
end
