class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :all_posts]

  #GET /posts
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  #GET /posts/new
  def new
    @post = Post.new
  end

  #POST /posts
  def create
    @post = current_user.posts.new post_params
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: 'Post was succesfully created!'
    else
      render :new
    end
  end

  #GET /posts/1
  def show
    @post = Post.find_by id: params[:id]
  end

  #GET /posts/1/edit
  def edit
    @post = Post.find_by id: params[:id]
  end

  #PUT/PATCH /posts/1
  def update
    @post = Post.find_by id: params[:id]
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  #DELETE /posts/1
  def destroy
    @post = Post.find_by id: params[:id]
    @post.destroy
    redirect_to posts_path
  end

  #GET /posts/all_posts
  def all_posts
    @posts = Post.all
      .page(params[:page])
  end

  #GET /search
  def search
    @posts = Post.where('title LIKE ?', '%' + search_params + '%')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def search_params
    params.require(:query)
  end
end
