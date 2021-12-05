class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    if @post_comment.save
      redirect_back(fallback_location: root_path)
    else
      @post = Post.find(params[:post_id])
      render 'posts/show'
    end
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
