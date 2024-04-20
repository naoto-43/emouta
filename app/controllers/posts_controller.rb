class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:tags].split(',').map(&:strip)
    if @post.save
      @post.save_tags(tag_list) unless tag_list.empty?
      binding.pry
      redirect_to root_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      binding.pry
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.post_comments
    @new_comment = PostComment.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    tag_list = params[:post][:tags].split(',').map(&:strip)
    if @post.update(post_params)
      @post.save_tags(tag_list) unless tag_list.empty?
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end

  private

  def post_params
    params.require(:post).permit(:lyrics, :song_title, :artist, :link_to_music, tags: [])
  end
end
