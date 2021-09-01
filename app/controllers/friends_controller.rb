class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /friends or /friends.json
  def index

    @friends = Friend.where(user_id: current_user.id).order(email: :desc)
   # @friends = Friend.where(user_id: current_user.id).order(facebook: :desc)
  end


  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    # @friend = Friend.new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    # @friend = Friend.new(friend_params)
    @friend = current_user.friends.build(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: "NOt Authorize Edit this Friend" if @friend.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :facebook, :user_id)
    end
end

    # Полю об'єкта присвоюється результат виконання методу where, у якому передається параметром id user. Виконується запит в базу даних
    #id = current_user.id
    # @friends = Friend.where(user_id: id) 
    #users_friends = Friend.where(user_id: id) 
    # Змінній sorted_friends присвоюється результат виконання методу order, якому передається параметром ключ first_name (символ, це вбудований тип даних у рубі), 
    # цей ключ представляє назву колонки по якій ми хочемо відсортувати  
    #sorted_friends = users_friends.order(:first_name)
    # Полю об'єкта @friends присвоюєтсь значення змінної sorted_friends
    #@friends = sorted_friends
#ДОМАШНЄ ЗАВДАННЯ. ОПИСАТИ ТОЙ РЯДОК ЗА ДОПОМОГОЮ ПРАВИЛЬНОЇ ТЕРМІНОЛОГІЇ
#Змінній стану Friend присвоюється результат виконання методу order, якій передається параметром ключ first_name,
#отриманий з результату виконання методу where, що виконує запит в базу даних і передає id user(a). Це зв'язує стовбець first_name з id user(a)
# із результату виконання методу where, що предав параметром id usera, виконуючи запит в базу даних  
#
#Полю об'єкта Friends присвоюється результат виконання методу order
#методу order передається параметром ключ first_name
#дані ключа  first_name отриманий з запису колонки user_id
#дані ключа first_name отримані з результату виконання методу where
#метод where застосовується до константи класу Friend
#метод where робить запит в базу даних
#метод where відфільтровує записи у колонці user_id котрі відповідають значенню id об'єкта current_user                               
    #@friends = Friend.where(user_id: current_user.id).order(:first_name)


