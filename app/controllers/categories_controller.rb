class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:recipes)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category is successfully created!"
    else
      render "new"
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
