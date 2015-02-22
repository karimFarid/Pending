require 'uri'
class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :nested_comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 2 }
	validates :body, presence: true, length: { minimum: 3 }
	validates :author, presence: true
	
	def extract_links(post)
		links = URI.extract(post.body)
	end
end
