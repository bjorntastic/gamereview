class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@review = Review.new
  	@game = Game.find(params[:game_id])
  	@review.game = @game
  end

  def create
  	@review = Review.new(review_params)
  	@game = Game.find(params[:game_id])
  	@review.game = @game
  	if @review.save
  		flash[:notice] = 'Review created.'
  		redirect_to @game
  	else
  		render 'new'
  	end
  end

  def edit
  end

  private

  def review_params
  	params.require(:review).permit(:rating, :title, :comment)
  end

end
