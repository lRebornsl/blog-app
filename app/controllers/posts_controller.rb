class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @post = Post.find(params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
