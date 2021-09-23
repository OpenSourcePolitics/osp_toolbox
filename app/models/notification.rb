# frozen_string_literal: true

# Notification class
class Notification < ApplicationRecord
  class << self
    def notify!(resource)
      notification = Notification.find_by(resource_class: resource.class.name, resource_id: resource.id)

      return if notification.nil?

      send_notification(User.find(notification.target_id), resource.notification_message)

      notification.destroy!
    end

    def send_notification(user, message)
      RequestBuilder.send_post_request(generate_content(user, message), url)
    end

    alias register! create!

    private

    def url
      URI(ENV.fetch("ROCKET_CHAT_URL", "change-me.org"))
    end

    def generate_content(user, message)
      {
          text: I18n.t("notification", scope: "rocket_chat", user: user.nickname, message: message)
      }
    end
  end
end
