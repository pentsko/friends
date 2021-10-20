class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

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
		@posts = current_user.posts
	end

	def all_posts
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :author)
	end



end
