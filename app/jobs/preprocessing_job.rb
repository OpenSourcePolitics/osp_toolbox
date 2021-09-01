# frozen_string_literal: true

# Send data to preprocessing
class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    content = PreprocessingSerializer.serialize(preprocessing)
    RequestBuilder.send_post_request(content, URI("#{ENV['PREPROCESSING_URL']}?filename=raw_data"))

    preprocessing.update!(sent_to_preprocessing_at: Time.now)
  end
end
