class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_search_query, only: %i[index new show edit]
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:tags].split(',').map(&:strip)
    if @post.save
      @post.save_tags(tag_list) unless tag_list.empty?
      redirect_to root_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
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
      flash.now[:danger] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end

  def search
    @q = Post.ransack(search_params)
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:lyrics, :song_title, :artist, :link_to_music, :story, tags: [])
  end

  def search_params
    params.require(:q).permit(:song_title_cont, :artist_cont, :tags_name_cont)
  end
end
