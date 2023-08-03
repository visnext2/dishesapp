class Chef < ApplicationRecord
  before_save {self.email =email.downcase}
  validates :chefname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum:255},format:{with: VALID_EMAIL_REGEX},
  uniqueness:{case_sensitive: false}
  has_many :dishes, dependent: :destroy
  
  has_secure_password
  validates :password, presence: true, length: {minimum: 5}, allow_nil: true
  has_many :comments, dependent: :destroy

  # has_many :comments
  # has_many :dishes, through: :comments
end  