class Public::PostsController < ApplicationController
    #before_action :authenticate_user!

  def new
    @post = Post.new
    @user = current_user
  end

  def index
    #@posts = Post.all
    @user = current_user
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @posts = @category.posts.page(params[:page])
    elsif params[:place_key].present?
      @posts = Post.where('place LIKE ?', "%#{params[:place_key]}%")
    else
      @posts = Post.all
    end

  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments= @post.post_comments
    @categories = Category.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "商品内容が変更されました。"
      redirect_to post_path(@post)
    else
      flash[:notice] = "商品の内容変更に不備があります。"
      render "edit"
    end
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
