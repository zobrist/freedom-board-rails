class PostsController < ApplicationController
  def index
    @posts = Post.limit(5).order('id desc')
  end

  def show
    @posts = Post.where("user like ? OR message like ?", '%' + params[:keyword] + '%', '%' + params[:keyword] + '%') 
    render '/posts/index'
  end

  def create
    d = DateTime.now
    d = d.strftime("%m/%d/%Y %H:%M")
    @post = Post.new(post_params)

    if(@post.user == "")
      @post.user = "Anonymous"
    end

    @post.time = d
    @post.save
    index
    render '/posts/index'    
  end

  private def post_params
    params.permit(:user, :message);
  end
end
