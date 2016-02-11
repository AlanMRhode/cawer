class PostsController < ApplicationController
  def create
    new_post = Post.create(params[:post])
    current_user.posts.push(new_post)
  	redirect_to (:back) 
  end

  def show
  end

  def update
  end

  def destroy
    @post = params[:id]
    Post.destroy(@post)
    redirect_to user_path current_user
  end
end
