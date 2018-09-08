class PostsController < ApplicationController
  # before_action :set_user, only: [:create]
  before_action :set_posts, only: [:show, :update, :edit, :destroy]
  
  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render partial: "form"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redirect :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
  end

  def edit
    render partial: "form"
  end

  def new
    @post = Post.new
    render partial: "form"
  end

private

def set_user
  @user = User.find(params[:user_id])
end

def set_posts
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:content)
end

end

