class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  # 管理者側 投稿一覧
  def index
    @post_comments = PostComment.all.page(params[:page]).per(10)
    # 投稿数
    @post_comment_count = PostComment.all.count
  end

  # 不適切な投稿の削除
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    flash[:notice] = "不適切な投稿を削除しました"
    redirect_to admin_post_comments_path
  end
  
end