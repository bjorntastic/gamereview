class ReviewsController < ApplicationController

  before_action :check_if_logged_in
  
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

  def destroy
  	@game = Game.find(params[:game_id])
  	Review.find(params[:id]).destroy
  	flash[:notice] = 'Review deleted.'
  	redirect_to @game
  end

  private

  def review_params
  	params.require(:review).permit(:rating, :title, :comment)
  end

end
