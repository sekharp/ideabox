class IdeasController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @ideas = @user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @user = User.find(session[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      redirect_to @idea
    else
      flash[:error] = @idea.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea
    else
      flash.now[:errors] = @idea.errors.full_messages(", ")
      render :edit
    end
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:name)
  end

end
