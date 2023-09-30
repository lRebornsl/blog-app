class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])

    if @post.nil?
      redirect_to posts_path
    end
  end
end
