class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :updae]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.new(post_comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      @comments = @post.post_comments.reload
      @new_comment = @comment
      render 'posts/show'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.find(params[:id])
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
