class ReviewsController < ApplicationController

  before_action :check_if_logged_in
  before_action :set_project
  
  def new
    # could also run Review.new and set @review.game_id = @game
  	@review = @game.reviews.build
  end

  def create
  	@review = @game.reviews.build(review_params)
    @review.user_id = session[:user_id]
  	if @review.save
  		flash[:notice] = 'Review created.'
  		redirect_to @game
  	else
  		render 'new'
  	end
  end

  def destroy
  	Review.find(params[:id]).destroy
  	flash[:notice] = 'Review deleted.'
  	redirect_to @game
  end

  private

  def review_params
  	params.require(:review).permit(:rating, :title, :comment)
  end

  # instead of calling it in every method, it's the parent resource
  def set_project
    @game = Game.find(params[:game_id])
  end

end
