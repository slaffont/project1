class GamesController < ApplicationController
  layout "application"

  def index
    game = Game.api_call
    redirect_to "/games/#{game.id}"
  end

  def show
    @game = Game.find(params[:id])
    @image = Photo.find(params[:image_id]) unless params[:image_id].nil?
  end
end


