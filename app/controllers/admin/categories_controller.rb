class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @ideas = Idea.where(category_id: @category.id)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category successfully saved."
      redirect_to admin_categories_path
    else
      flash.now[:errors] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to admin_categories_path
  end

private

def category_params
  params.require(:category).permit(:name)
end

end
