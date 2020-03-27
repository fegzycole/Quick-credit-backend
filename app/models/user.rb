# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstName, presence: true, length: { minimum: 3 }
  validates :lastName, presence: true, length: { minimum: 3 }
  validates :address, presence: true, length: { maximum: 250 }
  validates :isAdmin, presence: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  private

  def downcase_email
    email.downcase!
  end
end
