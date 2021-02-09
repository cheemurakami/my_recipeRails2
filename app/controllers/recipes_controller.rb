class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:title)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end

  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end
end
