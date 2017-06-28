class PostsController < ApplicationController

  before_action :authenticate_user!, except: [ :index, :show ]

  def new
    #사용자가 데이터를 입력할 화면
    #자동으로 액션 이름과 같은 화면을 불러서 사용자에게 보여줘라.!!
  end

  def create
    # 입력받은 데이터를 실제 db에 저장할 액션.
    # 저장만 하면 되기때문에 보여주는 부분이 필요 없다.

    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = current_user.id
    @post.like = 0;
    @post.save

    redirect_to "/posts/show/#{@post.id}"
  end

  def index
    # @posts = Post.all
    @posts = Post.all.page(params[:page]).per(3)
  end

  def show
    @post = Post.find(params[:post_id])
    @post.like +=1
    @post.save
    # 처음 :post_id가 컬럼이름으로 확정, params[:post_id] 주소창에서 넘어오는 값
    # @comments = Comment.where(:post_id => params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])

  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    redirect_to '/posts/index'
  end

  def edit
    #작성하는 곳
    @post = Post.find(params[:post_id])
  end

  def update
    #실제 디비에 업데이트 되는 곳
    @post = Post.find(params[:post_id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    redirect_to '/posts/index'
  end
end
