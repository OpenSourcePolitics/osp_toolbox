# frozen_string_literal: true

# Send data to preprocessing
class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    @preprocessing = preprocessing

    @preprocessing.update!(sent_to_preprocessing_at: Time.current)

    RequestBuilder.send_post_request(content, url, false)
  end

  private

  def url
    URI("#{ENV['PREPROCESSING_URL']}?token=#{token}&preprocessing_id=#{@preprocessing.id}")
  end

  def token
    TokenBuilder.generate_token(@preprocessing.file)
  end

  def content
    PreprocessingSerializer.serialize(@preprocessing)
  end
end
