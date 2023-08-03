class Ingredient < ApplicationRecord
  validates :name, presence: true, length: {minimun: 3,maximum: 250}
  validates_uniqueness_of :name
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

end  