class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(recipe_id: params[:recipe_id])
  end

  def create

  end
end
