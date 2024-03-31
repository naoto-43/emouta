class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.new(post_comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end
  
  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
