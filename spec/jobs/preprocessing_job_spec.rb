require 'rails_helper'

RSpec.describe PreprocessingJob, type: :job do
  subject { described_class }
  let(:processing) { build(:processing) }

  before do
    allow(RequestBuilder).to receive(:send_post_request).and_return(true)
  end

  it "sets sent_to_preprocessing_at" do
    subject.perform_now(processing)

    expect(processing.sent_to_preprocessing_at).not_to be_nil
  end
end
