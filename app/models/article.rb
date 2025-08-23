
## '<' is to inherit from
class Article < ApplicationRecord
  
  ## Active Record validation
  ## 'presence: true' - Forces the data to be NOT NULL
  ## 'length: {...}'  - Forces min/max string length
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end