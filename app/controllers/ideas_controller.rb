class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      session[:idea_id] = @idea.id
      redirect_to @idea
    else
      # errors later implement them or DIE
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
  end

  private

  def idea_params
    params.require(:idea).permit(:name)
  end

end
