class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image successfully saved."
      redirect_to admin_images_path
    else
      flash.now[:errors] = @image.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    Image.destroy(params[:id])
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :link)
  end

end
