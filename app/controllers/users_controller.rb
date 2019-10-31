class UsersController < ApplicationController
  def show
    @profil = User.find(params['id'])
  end

  def create
  
  end

  def 

  end
end
