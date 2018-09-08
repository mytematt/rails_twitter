class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_user
  
  def new
    @comment = Comment.new
    render partial: "form"
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@post)
    else
      render partial: "form"
    end
  end

private

def set_user
  @user = current_user
end

def set_post
  @post = current_user.posts.find(params[:post_id])
end

def comment_params
  params.require(:comment).permit(:message)
end
end
