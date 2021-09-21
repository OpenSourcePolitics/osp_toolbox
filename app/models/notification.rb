# frozen_string_literal: true

# Notification class
class Notification < ApplicationRecord
  def self.notify!(resource)
    notification = Notification.find_by(resource_class: resource.class.name, resource_id: resource.id)

    send_notification(User.find(notification.target_id), resource.notification_message)

    notification.destroy!
  end

  def self.send_notification(user, message)
    url = URI(ENV["ROCKET_CHAT_URL"])
    content = { text: I18n.t("notification", scope: "rocket_chat", user: user.nickname, message: message) }

    RequestBuilder.send_post_request(content, url)
  end

  def self.register!(event_name:, resource_class:, resource_id:, target_id:)
    create!(event_name: event_name, resource_class: resource_class, resource_id: resource_id, target_id: target_id)
  end
end
