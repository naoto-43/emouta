class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update]

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

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.find(params[:id])
  
    if @comment.update(post_comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.find(params[:id])
    @comment.destroy!
    redirect_to @post, success: t('defaults.message.deleted', item: Comment.model_name.human)
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
