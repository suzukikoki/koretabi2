class Public::HomesController < ApplicationController
  
  def top
    @post = Post.order('id DESC').limit(3)
    @posts = Post.all
    @categories = Category.all
  end
  
  def about
  end
  
end
