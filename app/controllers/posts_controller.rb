class PostsController < ApplicationController
  before_action :set_posts, only: [:show, :update, :edit, :destroy]
  
  def index
    @posts = Post.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

private

def set_posts
  @post = Post.find(params[:id])
end

end

