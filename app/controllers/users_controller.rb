class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @users = User.all.page(params[:page])
  #  show all users without current(doesn`t work) @users = User.all_except(current_user).page(params[:page])
  end

  def new
    @user = User.new
  end
  #
  # def update
  #   @user = User.find_by id: params[:id]
  #   if @user.update user_params
  #     redirect_to url: "/users"
  #   else
  #     render :new
  #   end
  # end

  def show
    @user = User.find_by id: params[:id]
  end

  def create
    @user = User.create user_params
    if @user.save
      redirect_to home_about_path
    else
      render :new
    end
  end
  #
  # def destroy
  #   @users = User.find_by id: params[:id]
  #   @users.destroy
  #   redirect_to users_path
  # end


  def sign_up_params
    perams.require(:user).permit(:email, :password_confirmation, :firstname, :lastname, :date_of_birth)
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :avatar, :password_confirmation, :date_of_birth)
  end
end
