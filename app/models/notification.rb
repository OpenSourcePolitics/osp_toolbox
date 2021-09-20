# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

class Notification < ApplicationRecord
  def self.notify!(resource)
    notification = Notification.find_by(resource_class: resource.class.name, resource_id: resource.id)

    self.send_notification(User.find(notification.target_id), resource.notification_message)

    notification.destroy!
  end

  def self.send_notification(user, message)
    url = URI(ENV["ROCKET_CHAT_URL"])

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({text: I18n.t("notification", scope: "rocket_chat", user: user.nickname, message: message)})

    https.request(request)
  end

  def self.register!(event_name:, resource_class:, resource_id:, target_id:)
    self.create!(event_name: event_name, resource_class: resource_class, resource_id: resource_id, target_id: target_id)
  end
end
