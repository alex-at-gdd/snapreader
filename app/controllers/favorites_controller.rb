class FavoritesController < ApplicationController

def create
  @user = current_user
  @favorite = @user.favorites.create(favorite_params)
  respond_to do |format|
    format.js
  end
end


  private
    def favorite_params
      params.require(:favorite).permit(:url, :title)
    end
end