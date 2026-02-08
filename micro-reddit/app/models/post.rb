class Post < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :title, length: { minimum: 3, maximum: 200 }
  validates :body, presence: true
  validates :body, length: { minimum: 10 }
  
  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy
end

