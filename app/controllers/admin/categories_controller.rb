require_relative 'admin_controller'
class Admin::CategoriesController < Admin::AdminController
  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(
      :name
      )
  end
end
