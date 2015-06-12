class UsersController < ApplicationController
  
  def login
  end

  def logout
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		# store login in the session here
  		flash[:notice] = "You're logged in."
  		redirect_to '/games'
  	else
  		flash[:notice] = 'Invalid username and/or password.'
  		redirect_to '/'
  	end
  end

  def register
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = 'New account created.'
  		redirect_to '/'
  	else
  		render 'register'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
