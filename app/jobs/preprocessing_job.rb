# frozen_string_literal: true

# Send data to preprocessing
class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    token = TokenBuilder.generate_token(preprocessing)

    url = URI("#{ENV['PREPROCESSING_URL']}?token=#{token}&preprocessing_id=#{preprocessing.id}")

    content = PreprocessingSerializer.serialize(preprocessing)
    RequestBuilder.send_post_request(content, url)

    preprocessing.update!(sent_to_preprocessing_at: Time.now)
  end
end
