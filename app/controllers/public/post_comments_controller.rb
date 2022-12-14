class Public::PostCommentsController < ApplicationController
    before_action :authenticate_user!
    
      # コメント投稿
  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.save
    redirect_to post_path(@post)
  end

  # コメント削除
  def destroy
    @post_comment = PostComment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    @post_comment.save
    redirect_to post_path(@post)
  end

  private
  # ストロングパラメータ
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
  
end
