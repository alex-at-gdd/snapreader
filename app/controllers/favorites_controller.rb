class FavoritesController < ApplicationController

def create
  @user = current_user
  @favorite = @user.favorites.create(favorite_params)
  respond_to do |format|
    format.js
  end
end

def index
  @user = current_user
end


  private
    def favorite_params
      params.require(:favorite).permit(:url, :title)
    end
end