# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProcessDocumentJob do
  subject(:job) { described_class }

  let!(:document) { create(:document) }
  let(:response) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/archive.zip")) }

  before do
    allow(RequestBuilder).to receive(:send_post_request).and_return(OpenStruct.new(body: response))
  end

  it "create an archive" do
    expect do
      job.perform_now(document.id)
    end.to change(Archive, :count).by(1)
  end

  context "when document id doesn't exist" do
    it "doesn't create an archive" do
      expect do
        job.perform_now(nil)
      end.not_to change(Archive, :count)
    end

    it "doesn't call RequestBuilder" do
      job.perform_now(nil)
      expect(RequestBuilder).not_to have_received(:send_post_request)
    end

    it "doesn't raise error" do
      expect { job.perform_now(nil) }.not_to raise_error
    end
  end

  context "when the archive already exists" do
    # rubocop:disable RSpec/LetSetup
    let!(:archive) { create(:archive, document:) }
    # rubocop:enable RSpec/LetSetup

    it "doesn't create an archive" do
      expect do
        job.perform_now(document.id)
      end.not_to change(Archive, :count)
    end
  end
end
