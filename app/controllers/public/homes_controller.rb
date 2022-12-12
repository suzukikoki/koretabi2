class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    @categories = Category.all
  end
  
  
end
