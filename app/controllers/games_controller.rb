class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = 'Game created.'
      redirect_to :games
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = 'Game updated.'
      redirect_to :games
    else
      render 'new'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:notice] = 'Game deleted.'
    redirect_to :games
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre, :publisher, :platform)
  end

end
