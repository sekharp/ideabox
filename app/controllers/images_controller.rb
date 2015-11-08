class ImagesController < ApplicationController

  def new
    @images = Image.all
  end

  def create
    idea = Idea.find(params[:idea_id])
    image = Image.find(params[:image_id])
    idea.images.create(name: image.name, link: image.link)
    redirect_to idea_path(idea)
  end
end
