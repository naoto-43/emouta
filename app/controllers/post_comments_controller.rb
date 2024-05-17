class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.post_comments.new(post_comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      flash[:success] = t('defaults.message.created', item: PostComment.model_name.human)
      @comments = @post.post_comments.reload
      respond_to do |format|
        format.turbo_stream { render 'create', locals: { post: @post, new_comment: PostComment.new } }
        format.html { redirect_to @post }
      end
    else
      @comments = @post.post_comments.reload
      flash.now[:danger] = t('defaults.message.not_created', item: PostComment.model_name.human)
      render 'posts/show', status: :unprocessable_entity
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
      redirect_to @post, success: t('defaults.message.updated', item: PostComment.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: PostComment.model_name.human)
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.find(params[:id])
    @comment.destroy!
    respond_to do |format|
      format.html { redirect_to @post, notice: t('defaults.message.deleted', item: Comment.model_name.human) }
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("comment_#{params[:id]}")
      end
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_id)
  end
end
