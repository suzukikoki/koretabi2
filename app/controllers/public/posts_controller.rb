class Public::PostsController < ApplicationController
    #before_action :authenticate_user!

  def new
    @post = Post.new
    @user = current_user
  end
  
  def index
    @posts = Post.all
    @user = current_user
    @categories = Category.all
  end
  
  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments= @post.post_comments
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.latitude = params[:post][:latitude].to_f
    @post.longitude = params[:post][:longitude].to_f
    @post.user_id = current_user.id



    if @post.save
      redirect_to post_path(@post),notice:'投稿完了しました:)'
    else
      render:new
    end


  end

    private

  def post_params
    params.require(:post).permit(:user_id, :category_id, :image, :place, :description, :latitude, :longitude)
  end


end
