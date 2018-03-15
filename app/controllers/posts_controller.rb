class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new

  end

  def show
    @posts = Post.where("user like ? OR message like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%") 
    render '/posts/index'
  end

  def create
    d = DateTime.now
    d = d.strftime("%m/%d/%Y %H:%M")
    @post = Post.new(post_params)
    @post.time = d
    @post.save
    index
    render '/posts/index'    
  end

  private def post_params
    params.permit(:user, :message);
  end
end
