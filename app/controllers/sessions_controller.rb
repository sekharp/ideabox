class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user
      flash.now[:notice] = "Invalid Password"
      render :new
    else
      flash.now[:notice] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end

end
