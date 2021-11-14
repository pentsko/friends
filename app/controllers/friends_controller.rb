class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def add
    current_user.friends << User.find(params[:friend_id])
      redirect_to friends_list_path
  end
end

