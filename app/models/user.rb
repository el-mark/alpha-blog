class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /[\w\.]+@([\w]+\.)+[\w]{2,4}/i
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX,
                              message: 'It has to be a valid email'}
end