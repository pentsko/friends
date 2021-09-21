class FriendsController < ApplicationController
   before_action :authenticate_user!, except: [:show]


# 1)ДЗ повинно показувати add friends тільки тих кого у мене ще немає в друзях
# https://guides.rubyonrails.org/active_record_querying.html#conditions
# https://guides.rubyonrails.org/active_record_querying.html#joining-tables - там є ключ
# 2) додати асоціацію між постами і юзерами(один користувач може мати багато постів, пост належить одному користувачу)
# 3)додати сторінку "мої пости" на якій відображатимуться пости які належать поточному залогованому юзеру(сторіно для створ і видалення поста покищо не потрібно)
# створювати пости в консолі покищо
  def users
    @users = User.all
  end


  def create
    puts "See params"
    puts "----------------"
    puts params.inspect
    puts "--------"
    id = params[:godzilla_id]
    friend = User.find(id)
    current_user.friends << friend
    # Парамс поверне значення для ключа friend_id, яке буде ід юзера якого ми хочим додати в друзі
    redirect_to friends_list_path
  end


  def list_friends

    @friends = current_user.friends

  end

  def destroy
    puts "See params"
    puts "----------------"
    
    puts params.inspect
        puts "--------"
        id = params[:gorilla_id]
    friend = User.find(id)
    current_user.friends.destroy(friend)
    # @connection = Connection.current_user.friends.find_by friend_id: params[:connection_id]
    # @connection = Connection.current_user.find_by user_id: params[:connection_id]
    # @connection.destroy
    redirect_to friends_list_path

  end

  def delete_friendship
    
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


