# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProcessDocumentJob do
  subject(:job) { described_class }

  let(:document) { build(:document) }
  let(:response) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/archive.zip")) }

  before do
    allow(RequestBuilder).to receive(:send_post_request).and_return(Struct.new(body: response))
  end

  it "create an archive" do
    expect do
      job.perform_now(document)
    end.to change(Archive, :count).by(1)
  end

  context "when the archive already exists" do
    # rubocop:disable RSpec/LetSetup
    let!(:archive) { create(:archive, document:) }
    # rubocop:enable RSpec/LetSetup

    it "doesn't create an archive" do
      expect do
        job.perform_now(document)
      end.not_to change(Archive, :count)
    end
  end
end
