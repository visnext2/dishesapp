class Comment < ApplicationRecord
  belongs_to :dish
  belongs_to :chef
  validates :description, presence: true, length: {maximum: 50}
  validates :chef, presence: true
  validates :dish, presence: true


end 