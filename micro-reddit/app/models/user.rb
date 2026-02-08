class User < ApplicationRecord
  # Username validations
  validates :username, presence: true
  validates :username, length: { minimum: 3, maximum: 50 }
  validates :username, uniqueness: true
  
  # Email validations
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

