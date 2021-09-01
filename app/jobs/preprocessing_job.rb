class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    content = PreprocessingSerializer.serialize(preprocessing)
    response = RequestBuilder.send_post_request(content, URI(ENV["PREPROCESSING_URL"]))

    preprocessing.update!(preprocessed_data: response)
  end
end