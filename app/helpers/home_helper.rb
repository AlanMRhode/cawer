module HomeHelper
	def posts
		html= ""
		def render(post)
			content_tag :div, class: "hover_div" do 
				content_tag :div, class: "all_post_div" do 
					content_tag :strong, class: "full_name" do
						post.user.fname + ' ' + post.user.lname 
					end
					post.user.username 
					content_tag :h4, class: "post_title_heading" do 
						post.title.upcase 
					end
					content_tag :p, class: "post_content" do
						post.content
					end
					post.comments.all.each do |comment| 
						content_tag :div, class: "all_comments_div" do 
							content_tag :p, class: "comment_content" do
								comment.content
							end
							if @current_user.id == comment.user_id 
								button_to "Delete Comment", post_comment_path(post.id, comment.id), method: :delete, class: "delete_comment_button" 
							end 
						end 
					end 
					button_tag "Leave Comment", class: "leave_comment_button" 
					form_for @comment, url: post_comments_path(post.id), html: {class: "post_comment_form"} do |c| 
						content_tag :div, class: "post_comment_div" do 
							c.text_field :content 
							c.submit "Comment" 
						end 
					end 
					if @current_user.id == post.user.id 
						button_to "Delete Post", post_path(post.id), method: :delete, class: "delete_post_button" 
					end 
				end
			end
		end
		Post.all.reverse.each do |posts| 
			html << render(posts)
		end 
		html.html_safe
	end
end