class NestedCommentsController < ApplicationController
	def new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:comment_id])
		@nested_comment = @comment.nested_comments.new(nested_comments_params)
		@nested_comment.commenter = current_user.email
		@nested_comment.save
		redirect_to @post
	end

	def destroy
		 @post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:comment_id])
    	@nested_comment = @comment.nested_comments.find(params[:id])
    	@nested_comment.destroy
    	redirect_to @post
	end
	private
	def nested_comments_params
		params.require(:nested_comment).permit(:body)
	end
end
