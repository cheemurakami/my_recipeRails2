class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :steps
  has_and_belongs_to_many :categories

  
  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}
  
  def self.search(search)
    Recipe.left_joins(:categories).where("recipes.title ILIKE ? or recipes.description ILIKE ? or categories.name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").distinct
  end

end

# This could work for self.search but it's longer
# def self.search(search)
#   (Recipe.where("title ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%") +   get_recipes_from_categories(search)).uniq
# end
# def self.get_recipes_from_categories(search)
#   #searched categories
#   searched_categories = Category.where("name ILIKE ?", "%#{search}%")
#   #recipes
#   searched_categories.map{|category| category.recipes}.flatten
# end

###!!! This doesn't work for self.search because .includes loads only and doesn't query !!!###
# Recipe.includes(:categories).where("recipes.title ILIKE ? or recipes.description ILIKE ? or categories.name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")