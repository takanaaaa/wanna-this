class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def index
    favorites = Favorite.where(user_id: current_user).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
