class PostsController < ApplicationController
  def index
    @posts = Post.limit(5).order('id desc')

  end

  def new
    @post = Post.new
  end

  def show
      @post = Post.find(params[:id])
  end

  def create
    d = DateTime.now
    d = d.strftime("%m/%d/%Y %H:%M")
    @post = Post.new(post_params)

    if(@post.user == "")
      @post.user = "Anonymous"
    end

    @post.time = d
    if(@post.save)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def all_posts
    @posts = Post.all

  end

  private def post_params
    params.require(:post).permit(:user, :message);
  end
end
