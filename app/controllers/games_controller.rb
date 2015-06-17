class GamesController < ApplicationController
  
  before_action :check_if_logged_in
  before_action :set_game, :only => [:show, :edit, :destroy]
  helper_method :sort_by, :direction_of 

  def search
    query = params[:search]
    if query.blank?
      @games = Game.all
      flash.now[:error] = "We can't search for nothing, try writing something in the box before hitting 'Go'."
      render 'index'
    else
      @result = Game.where("name like ?", "%#{query}%").first
      if @result.blank?
        @games = Game.all
        flash.now[:error] = "Couldn't find that game. Try something else!"
        render 'index'
      else
        redirect_to "/games/#{@result.id}"
      end
    end
  end

  def index
    @games = Game.where("name like ?", "%#{params[:search]}%").order("#{sort_by} #{direction_of}")
    if @games.blank?
      @games = Game.all
    end
  end

  def show; end

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

  def edit; end

  def update
    if @game.update(game_params)
      flash[:notice] = 'Game updated.'
      redirect_to :games
    else
      render 'new'
    end
  end

  def destroy
    @game.destroy
    flash[:notice] = 'Game deleted.'
    redirect_to :games
  end

  private

  def sort_by
    Game.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def direction_of
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :genre, :publisher, :platform)
  end

end
