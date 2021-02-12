class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :steps

  def self.search(search)
    Recipe.where("title ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
