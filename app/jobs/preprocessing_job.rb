class PreprocessingJob < ApplicationJob
  queue_as :default

  def perform(preprocessing)
    content = PreprocessingSerializer.serialize(preprocessing)
    response = PreprocessingRequest.send_post_request(content)

    preprocessing.update!(preprocessed_data: response)
  end
end