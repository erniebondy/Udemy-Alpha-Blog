class User < ApplicationRecord

  ## Downcase email
  before_save { self.email = email.downcase }

  ## User can have MANY articles <- plural
  ## 'dependent' meaning the articles DEPEND on the user
  ## If we were to delete the user, it's articles would also be deleted 
  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

  ## after add bcrypt
  has_secure_password
end