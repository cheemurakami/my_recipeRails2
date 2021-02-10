class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    if @ingredient = @recipe.ingredients.create(ingredient_params)
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private 
    def ingredient_params
      params.require(:ingredient).permit(:name, :qty, :uom, :recipe_id)
    end
end
