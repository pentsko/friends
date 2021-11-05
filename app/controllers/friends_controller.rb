class FriendsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @users = User.new
  end

  def create_user
    @users = User.new create_user_params
    if @users.save
      redirect_to friends_users_path
    else
      render :new
    end
  end

  def kill_user
    @users = User.find_by id: params[:id]
    @users.destroy
    redirect_to friends_users_path
  end

  def users
    @users = User.all_except(current_user).page(params[:page])
  end

  def create
    current_user.friends << User.find(params[:friend_id])
    redirect_to friends_list_path
  end

  def list_friends
    @friends = current_user.friends.page(params[:page])
  end

  def destroy
    current_user.friends.destroy(User.find(params[:destroy_id]))
    redirect_to friends_list_path
  end

  def sign_up_params
    perams.require(:user).permit(:email, :password_confirmation, :firstname, :lastname, :date_of_birth)
  end

  private

  def create_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password_confirmation, :password)
  end
end
