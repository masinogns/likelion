class CommentsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index, :show ]
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
    @comment = Comment.new
    @comment.content = params[:input_comment]
    @comment.post_id = params[:post_id]
    @comment.user_id = params[:user_id]
    @comment.save

    redirect_to "/posts/show/#{params[:post_id]}"
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to "/posts/show/#{params[:post_id]}"
  end
end
