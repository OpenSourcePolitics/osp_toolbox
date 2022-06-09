# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  before do
    helper.request.path = "dummy_path.org"
  end
  describe "infer_path" do
    before do
      allow(ActionController::Base).to receive(:controller_name).and_return("processings")
    end

    let(:path) { "dummy_path" }

    it "returns something" do
      expect(helper.infer_path(path)).to eq(path)
    end

    context "when path is nil" do
      let(:path) { nil }
      it "returns path" do
        expect(helper.infer_path(path)).to eq("/processings")
      end
    end
  end

  describe "search_query_placeholder" do
    let(:query) { "title_or_client_cont" }

    it "returns a proper placeholder string" do
      expect(helper.search_query_placeholder(query)).to eq("Title or client contains")
    end
  end

  describe "bootstrap_class_for" do
    let(:flash_types) do
      %i[success error alert notice]
    end

    let(:css_classes) do
      %w[bg-success bg-danger bg-warning bg-info]
    end

    it "returns css class" do
      flash_types.each_with_index do |type, index|
        expect(helper.bootstrap_class_for(type)).to eq(css_classes[index])
      end
    end
  end

  describe "analyses_count_for" do
    let!(:processing) { create(:processing) }
    let!(:analyses) { create_list(:analysis, 2, processing: processing) }

    it "returns 2" do
      expect(helper.analyses_count_for(processing)).to eq(2)
    end

    context "when file are empty" do
      let!(:analyses) { create_list(:analysis, 2, :without_file, processing: processing) }

      it "returns nil" do
        expect(helper.analyses_count_for(processing)).to eq(0)
      end
    end

    context "when analyses are empty" do
      let!(:analyses) { nil }

      it "returns nil" do
        expect(helper.analyses_count_for(processing)).to eq(nil)
      end
    end
  end

  describe "empty_search_path" do
    it "returns request path" do
      expect(helper.empty_search_path).to eq("dummy_path.org")
    end
  end
end
