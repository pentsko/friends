class HomeController < ApplicationController
  def about
    @about_me = "My name is Taras Pentsko"
    @sum = 2 + 4
  end

  def index
  end

  def contacts
  end
end
