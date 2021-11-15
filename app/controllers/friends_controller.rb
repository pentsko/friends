class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def add
    current_user.friends << User.find(params[:friend_id])
      redirect_to friends_list_path
  end

  def destroy
    @users = User.find_by id: params[:id]
    @users.destroy
    redirect_to users_path
  end

  def list_friends
    @friends = current_user.friends.page(params[:page])
  end
end

