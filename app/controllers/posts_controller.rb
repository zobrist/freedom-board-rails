class PostsController < ApplicationController
  def index
    @posts = Post.limit(5)
  end

  def new

  end

  def show
      @post = Post.find(params[:id])
  end

  def create
    d = DateTime.now
    d = d.strftime("%m/%d/%Y %H:%M")
    @post = Post.new(post_params)
    @post.time = d
    @post.save
    redirect_to posts_path
  end

  def all_posts
    @posts = Post.all
  end

  private def post_params
    params.require(:post).permit(:user, :message);
  end
end
