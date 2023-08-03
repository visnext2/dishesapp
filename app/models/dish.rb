class Dish < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimun: 5, maximum: 500}
  belongs_to :chef
  
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  has_many :comments, dependent: :destroy

  # has_many :comments
  # has_many :chefs, through: :comments
end  