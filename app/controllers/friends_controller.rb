class FriendsController < ApplicationController
   before_action :authenticate_user!, except: [:show]

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
     perams.require(:user).permit(:email,:password_confirmation,:firstname,:lastname,:date_of_birth)
   end

end
