class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def current_user
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
    else
      redirect_to root_path
      flash[:notice] = "Please Sign in"
    end
  end
  
  @to_follow = User.all.each
  @post = Post.new
  protect_from_forgery with: :exception
end
