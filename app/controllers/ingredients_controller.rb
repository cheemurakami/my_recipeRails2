class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(recipe_id: params[:recipe_id])
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      render 'new'
    end
  end

  private 
    def ingredient_params
      params.require(:ingredient).permit(:name, :qty, :uom, :recipe_id)
    end
end