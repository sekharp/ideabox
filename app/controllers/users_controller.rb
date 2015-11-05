class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
