class FavoritesController < ApplicationController

  def index

  end

  def update
  
    favorite = Favorite.where(lunch: Lunch.find(params[:lunch]), user: current_user)
    #if not found it'll return an empty array
    if favorite ==  [] # if favorite does not exist
      #create the favorite 
      Favorite.create(lunch: Lunch.find(params[:lunch]), user: current_user)
      @favorite_exists=true
    else
      #delete the favorite
      favorite.destroy_all
      @favorite_exists=false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
