class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def updated
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def ensure_current_user
    book = Book.find(params[:id])
    unless book.user == current_user
      redirect_to users_path
    end
  end


end
