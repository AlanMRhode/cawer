class CommentsController < ApplicationController
  def create
  	post_id = Post.find(params[:post_id])
  	c = Comment.create(params[:comment])
  	c.user_id = current_user.id
  	post_id.comments.push(c)
  	puts "*****************************"
  	puts @comment
  	puts "*****************************"
  	redirect_to (:back)
  end

  def edit
  end

  def destroy
  	comment = Comment.find(params[:id])
  	comment.destroy
  	redirect_to (:back)
  end
end
