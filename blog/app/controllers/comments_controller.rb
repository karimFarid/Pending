class CommentsController < ApplicationController
  def new
  end	
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commenter = current_user.email
    @comment.save
   	redirect_to @post
  end

  def destroy
  	@post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  	@comment.destroy
  	redirect_to @post
  end
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end