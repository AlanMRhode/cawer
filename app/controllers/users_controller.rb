class UsersController < ApplicationController
  layout "main"

  def index
  	@users = User.all
  end
  def new 
  	@user = User.new
  end

  def show
    current_user
  	@post =Post.new
    @comment = Comment.new
  end

  def create
    # Take params from new.html.erb
  	@user = User.create(params[:user])
    # Create a profile for @new_user
    @profile = Profile.create(user_id: @user.id)
    @profile = @user.profile
    # Redirect to the new_user's profile page.
  	redirect_to root_path
  end

  def edit

  end
  
  def destroy
    @user = User.find(current_user[:id])
    @user.destroy
    session.clear
    redirect_to root_path
  end 

private 
  def user_params
    
  end
end
