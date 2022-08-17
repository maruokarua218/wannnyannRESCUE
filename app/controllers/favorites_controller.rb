class FavoritesController < ApplicationController

  def index
    @favorite_pets = current_user.favorites.all
  end   

  def create
    favorite = current_user.favorites.create(pet_id: params[:pet_id])
    redirect_to pets_path, notice: "#{favorite.pet.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pets_path, notice: "#{favorite.pet.user.name}さんの投稿をお気に入り解除しました"
  end
end
