module ApplicationHelper

	def all_posts
		Post.all.each do |post| 
 			content_tag :div do 
			post.user.username 
			post.title
			post.content 
			end 
		end 
	end
end
