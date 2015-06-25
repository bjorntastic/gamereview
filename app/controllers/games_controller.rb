class GamesController < ApplicationController
  
  before_action :check_if_logged_in
  before_action :set_game, :only => [:show, :edit, :update, :destroy, :vote]
  helper_method :sort_by, :direction_of 

  def index
    @game = Game.new
    @games = Game.where("name like ?", "%#{params[:q]}%").order("#{sort_by} #{direction_of}")
    
    # use sql instead to get the sum(values) from other table
    # @games = Game.find_by_sql("SELECT games.id, games.name, games.publisher, games.genre, games.platform, sum(game_votes.value) as karma from games inner join game_votes on games.id = game_votes.game_id group by games.id, games.name, games.publisher, games.genre, games.platform, game_votes.game_id #{sorted_for_sql}")
    
  end

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @game = Game.new
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { flash[:notice] = 'Game created.'
                      redirect_to :games
                    }
        format.js { }
      else
        format.html { render 'new' }
        format.js { }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def update
    @games = Game.all
    respond_to do |format|
      if @game.update(game_params)
        format.html { flash[:notice] = 'Game updated.'
                      redirect_to :games }
        format.js { }
      else
        format.html { render 'new' }
        format.js { }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { flash[:notice] = 'Game deleted.'
                  redirect_to :games}
      format.js { }
    end
  end

  def vote
    vote = GameVote.new
    vote.game = @game
    vote.user_id = session[:user_id]
    vote.value = params[:value]
    if vote.save
      redirect_to :back, notice: 'Voted!'
    else
      redirect_to :back, notice: 'Didnt vote, something went wrong.'
    end
  end

  private

  def sorted_for_sql
    if params[:sort].nil? || params[:direction].nil?
      ""
    else
      "order by #{params[:sort]} #{params[:direction]}"
    end
  end

  def sort_by
    params[:sort].present? ? params[:sort] : 'games.created_at'
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
