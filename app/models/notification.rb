# frozen_string_literal: true

# Notification class
class Notification < ApplicationRecord
  class << self
    alias register! create!
  end

  def self.notify!(resource)
    notification = Notification.find_by(resource_class: resource.class.name, resource_id: resource.id)

    return if notification.nil?

    send_notification(User.find(notification.target_id), resource.notification_message)

    notification.destroy!
  end

  def self.send_notification(user, message)
    url = URI(ENV["ROCKET_CHAT_URL"])
    content = { text: I18n.t("notification", scope: "rocket_chat", user: user.nickname, message: message) }

    RequestBuilder.send_post_request(content, url)
  end
end
