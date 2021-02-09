class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:title)
  end
end
