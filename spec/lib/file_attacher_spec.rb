# frozen_string_literal: true

require "rails_helper"

RSpec.describe FileAttacher do
  subject { described_class }

  let(:processing) { build(:processing) }
  let(:perform_action) do
    subject.build_and_attach_file(
      model: processing,
      attached_to: :preprocessed_file_data,
      data: JSON.dump({ foo: "bar" }),
      name_prefix: "preprocessed_file_data",
      extension: "json"
    )
  end

  describe ".build_and_attach_file" do
    it "attachs file to the model" do
      expect(processing.preprocessed_file_data).not_to be_attached

      perform_action

      expect(processing.preprocessed_file_data).to be_attached
    end

    it "doesn't let temp file behinds" do
      perform_action

      expect(Rails.root.glob("tmp/*.json").size).to eq(0)
    end

    it "sets a prefix for the file" do
      perform_action

      expect(processing.preprocessed_file_data.filename.to_s).to start_with("preprocessed_file_data")
      expect(processing.preprocessed_file_data.filename.to_s).to end_with(".json")
    end
  end
end
