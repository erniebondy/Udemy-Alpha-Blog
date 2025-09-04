## '<' is to inherit from
class Article < ApplicationRecord
  ## Article only has 1 associated user
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  ## Active Record validation
  ## 'presence: true' - Forces the data to be NOT NULL
  ## 'length: {...}'  - Forces min/max string length
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end