class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
    current_user.follow(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user.id)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.following_user
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_user
  end

end
