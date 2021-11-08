class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :all_posts]

  def all_posts
    @posts = Post.all
                 .page(params[:page])
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by id: params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def index
    @posts = Post.where(:user_id => current_user.id)
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def search
    @posts = Post.where('title LIKE ?', '%' + params[:q] + '%')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
