class IngredientsController < ApplicationController
  def new

  end
  
  def create

  end

  private 
    def ingredient_params
      params.require(:ingredients).permit(:name, :qty, :uom, :recipe_id)
    end
end
