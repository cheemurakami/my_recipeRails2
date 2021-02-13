class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:recipes)
  end
end
