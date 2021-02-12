class ChangeRecipesCategoriesToCategoriesToRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_table :recipes_categories, :categories_recipes
  end
end
