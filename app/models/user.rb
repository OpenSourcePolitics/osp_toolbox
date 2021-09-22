# frozen_string_literal: true

# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :documents, dependent: :destroy
  validate :check_email_address

  def nickname=(string)
    value = string.start_with?("@") ? string : "@#{string}"

    super(value)
  end

  def check_email_address
    return if Rails.configuration.allowed_domains.empty?
    return unless Rails.configuration.allowed_domains.none? { |domain| email.end_with?(domain) }

    errors.add(:base, I18n.t("wrong_domain", scope: "user.validations", domains: Rails.configuration.allowed_domains.join(", ")))
  end
end
