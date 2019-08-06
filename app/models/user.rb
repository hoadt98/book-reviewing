class User < ApplicationRecord
  USER_PARAMS = %i(user_name email password password_confirmation).freeze

  before_save {email.downcase!}

  validates :user_name, presence: true, length: { maximum: Settings.name_max }
  validates :email, presence: true, length: { maximum: Settings.email_max },
  format: { with: Settings.VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: Settings.pass_min }, allow_nil: true

  has_secure_password
end
