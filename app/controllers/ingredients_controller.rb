class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
  end
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    @ingredient = recipe.ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path
    else
      render 'new'
    end
  end

  private 
    def ingredient_params
      params.require(:ingredients).permit(:name, :qty, :uom, :recipe_id)
    end
end
