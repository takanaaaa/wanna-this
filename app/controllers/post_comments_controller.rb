class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.save
    @post_comment = PostComment.new
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
