class CitiesController < ApplicationController
  def show
    @city_profil = City.find(params['id'])
    @array = Gossip.reorder('ID DESC').showall
  end
  
end
