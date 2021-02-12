class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :steps
  has_and_belongs_to_many :categories

  def self.search(search)
    Recipe.where("title ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%")
  end

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}
end
