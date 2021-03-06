# frozen_string_literal: true

# Send data to preprocessing
class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    @preprocessing = preprocessing

    @preprocessing.update!(sent_to_preprocessing_at: Time.current)

    RequestBuilder.send_post_request(content, url, wait_for_answer: false)
  end

  private

  def url
    URI("#{ENV.fetch('PREPROCESSING_URL', nil)}?token=#{token}&preprocessing_id=#{@preprocessing.id}")
  end

  def token
    TokenManager.generate_token(@preprocessing.string_to_generate_token)
  end

  def content
    PreprocessingSerializer.serialize(@preprocessing)
  end
end
