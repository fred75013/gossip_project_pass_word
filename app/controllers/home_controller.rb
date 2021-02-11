class HomeController < ApplicationController
  def index
    if current_user != nil
    @name =  current_user.first_name.capitalize
    end
  end

  def team

  end

  def contact

  end

end
