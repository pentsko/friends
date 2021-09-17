class FriendsController < ApplicationController
   before_action :authenticate_user!, except: [:show]



  def users
    @users = User.all
  end

  def create
    puts "See params"
    puts "----------------"
    puts params.inspect
    puts "--------"
    current_user.friends << User.find(params[:friend_id])
    # Парамс поверне значення для ключа friend_id, яке буде ід юзера якого ми хочим додати в друзі
    redirect_to friends_list_path
  end

  def list_friends
    @friends = current_user.friends

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


