class FriendsController < ApplicationController
  before_action :authenticate_user!

  # list current_user friends
  def index
    @friends = current_user.friends
  end

# current_user add user to friends
  def add
    current_user.friends << User.find(params[:friend_id])
    redirect_to friends_list_path
  end

  #show detail information obout correct_user
  def show
    @user = User.find_by id: params[:id]
  end

  #destroy user
  def destroy
    @users = User.find_by id: params[:id]
    @users.destroy
    redirect_to list_users_path
  end

  #destroy friedship
  def destroy_friendship
    current_user.friends.destroy(User.find(params[:destroy_id]))
    redirect_to friends_list_path
  end

  def list_friends
    @friends = current_user.friends.page(params[:page])
  end

  def list_users
    @users = User.all_except(current_user).page(params[:page])
  end
end
