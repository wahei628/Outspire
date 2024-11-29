class FavoritesController < ApplicationController
  before_action :require_login

  # お気に入り追加
  def create
    favorite = current_user.favorites.new(favorite_params)
    if favorite.save
      render json: { status: 'success', message: 'お気に入りに追加しました' }
    else
      render json: { status: 'error', message: 'お気に入りの追加に失敗しました' }, status: :unprocessable_entity
    end
  end

  # お気に入り一覧
  def index
    @favorites = current_user.favorites
  end

  def show
    @favorite = current_user.favorites.find(params[:id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:place_name, :place_address, :place_lat, :place_lng)
  end
end
