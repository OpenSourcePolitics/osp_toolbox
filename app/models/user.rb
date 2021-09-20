# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :documents, dependent: :destroy
  before_save :check_email_address

  def nickname=(string)
    value = string.start_with?("@") ? string : "@#{string}"

    super(value)
  end

  def check_email_address
    return if Rails.configuration.allowed_domains.empty?

    if Rails.configuration.allowed_domains.none? { |domain| email.end_with?(domain) }
      self.errors.add(:base, I18n.t("wrong_domain", scope: "user.validations", domains: Rails.configuration.allowed_domains.join(", ")))
    end
  end
end
