class Comment < ApplicationRecord
  # Validations
  validates :body, presence: true
  validates :body, length: { minimum: 5 }
  
  # Associations
  belongs_to :user
  belongs_to :post
end

