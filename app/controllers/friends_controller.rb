class FriendsController < ApplicationController
  before_action :authenticate_user!

  #GET /friends
  def index
    @friends = current_user.friends
  end

  #POST /friends
  def add
    current_user.friends << User.find(params[:friend_id])
    redirect_to friends_list_path
  end

  #GET /user/1
  def show
    @user = User.find_by id: params[:id]
  end

  #DELETE /user/1
  def destroy_specific_user
    @users = User.find_by id: params[:id]
    @users.destroy
    redirect_to list_users_path
  end

  #DELETE /friends/2
  def destroy_friendship
    current_user.friends.destroy(User.find(params[:destroy_id]))
    redirect_to friends_list_path
  end

  #GET /list_users
  def list_users
    @users = User.all_except(current_user).page(params[:page])
  end

  #GET /friends_list
  def list_friends
    @friends = current_user.friends.page(params[:page])
  end
end
