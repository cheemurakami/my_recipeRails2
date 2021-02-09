class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:title)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
