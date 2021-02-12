class RecipesController < ApplicationController

  before_action :set_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @three_most_recent = Recipe.three_most_recent
    if (params[:search])
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.order(:title)
    end
  end

  def show
    @steps = @recipe.steps
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

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_path
    else
      render 'show'
    end
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, category_ids:[])
    end
end
