class Public::UsersController < ApplicationController
    #before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @post_comments = @user.post_comments
  end

  def show
    #@user = User.find(params[:id])
    @user = current_user
    @post_comments = @user.post_comments
    @favorites = @user.favorites.page(params[:page]).per(5)
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
