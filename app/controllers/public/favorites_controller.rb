class Public::FavoritesController < ApplicationController

    # いいねをつける
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    redirect_to post_path(@post)
  end

  # いいねを消す
  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    redirect_to post_path(@post)
  end

end
