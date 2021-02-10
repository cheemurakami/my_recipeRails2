class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, :qty, presence: true
end
