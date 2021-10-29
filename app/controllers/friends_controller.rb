class FriendsController < ApplicationController
   before_action :authenticate_user!, except: [:show]

  def users
   @users = User.all_except(current_user)
  end

  def create
     id = params[:godzilla2_id]
    friend = User.find(id)
    current_user.friends << friend
    redirect_to friends_list_path
  end


  def list_friends
    @friends = current_user.friends
  end

  def destroy
    id = params[:destroy_id]
    friend = User.find(id)
    current_user.friends.destroy(friend)
    redirect_to friends_list_path
  end

   def sign_up_params
     perams.require(:user).permit(:email,:password_confirmation,:firstname,:lastname,:date_of_birth)
   end

end
