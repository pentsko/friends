class HomeController < ApplicationController
  def about
    @about_me = "My name is Taras Pentsko"
    @sum = 2 + 4
  end

  def index
    @user = User.find(1)
    #Метод friends результатом свого виконання повертає масив користувачів який представляє друзів того юзера до якого ми цей метод викликали
    #Асоціація friends повертає масив користувачів який представляє друзів того юзера
    @friends = @user.friends
  end

  def contacts
  end
end
