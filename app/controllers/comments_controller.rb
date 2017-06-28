class CommentsController < ApplicationController
  #before_action :authenticate_user!, except: [ :index, :show ]
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
    @comment = Comment.new
    @comment.content1 = params[:input_comment1]
    @comment.content2 = params[:input_comment2]
    @comment.content3 = params[:input_comment3]
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.pid = 0;
    @comment.count = 0;
    @comment.save

    redirect_to "/posts/show/#{params[:post_id]}"
  end

  def createTwo
    @comment = Comment.new
    @comment.content1 = params[:input_comment1]
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.pid = params[:comment_id]
    @comment.count = 0;
    @comment.save

    redirect_to "/posts/show/#{params[:post_id]}"
  end

  def count
    @countChecking = Comment.find(params[:comment_id])
    @countChecking.count +=1
    @countChecking.save

    redirect_to "/posts/show/#{params[:post_id]}"
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to "/posts/show/#{params[:post_id]}"
  end
end
