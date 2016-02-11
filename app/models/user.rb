class User < ActiveRecord::Base
	has_one :profile
	has_many :posts
	has_many :comments
	has_many :active_relationships, class_name: "Relationship",
	foreign_key: "follower_id",
	dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
	foreign_key: "followed_id",
	dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	validates :email, uniqueness: true
	validates :username, uniqueness: true

	def follow!(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
		following.include?(other_user)
	end

	def followers_posts
		all_posts = []
		@following = self.following
		@following.each do |s|
			@posts = s.posts
			@posts.each do |put|
				all_posts << put
			end
		end
		all_posts
	end
end
