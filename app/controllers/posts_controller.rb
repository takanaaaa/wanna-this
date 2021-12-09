class PostsController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @tag_list = params[:post][:tag_name].split(nil)
    if @post.save!
      @post.save_tag(@tag_list)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(" ")
  end

  def update
    @post = Post.find(params[:id])
    @tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(@tag_list)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def ensure_current_user
    post = Post.find(params[:id])
    unless post.user == current_user
      redirect_to posts_path
    end
  end
end
