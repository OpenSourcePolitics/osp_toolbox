# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Preprocessings", type: :request do
  let!(:user) { create(:user) }
  let!(:preprocessings) { create_list(:processing, 5, :with_preprocessed_file_data) }
  let(:processing) { preprocessings.first }
  let(:last_processing) { Processing.last }
  let(:title) { "Dummy title" }
  let(:client) { "Dummy client" }
  let(:url) { "Dummy url" }
  let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("db/seeds_data/subset_raw_data.csv"), "text/csv") }

  before do
    login_as(user)
  end

  describe "GET /index" do
    before { get "/preprocessings" }

    it "assigns preprocessings" do
      expect(assigns(:preprocessings)).to match_array(preprocessings)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET /show" do
    before { get "/preprocessings/#{processing.id}" }

    it "assigns preprocessing" do
      expect(assigns(:preprocessing)).to eq(processing)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET /new" do
    before { get "/preprocessings/new" }

    it "assigns preprocessing" do
      expect(assigns(:preprocessing).class).to eq(Processing)
    end

    it "renders the show template" do
      expect(response).to render_template("new")
    end
  end

  describe "GET /redo_processing" do
    before do
      allow(PreprocessingJob).to receive(:perform_later).with(processing).and_return(true)
      post "/preprocessings/#{processing.id}/redo_preprocessing"
    end

    it "enqueue the job" do
      expect(assigns(:preprocessing)).to eq(processing)
    end

    it "renders the show template" do
      expect(response).to redirect_to("/preprocessings.#{processing.id}")
    end
  end

  describe "POST /preprocessings" do
    before do
      post "/preprocessings", params: {
        processing: {
          title:,
          client:,
          url:,
          file:
        }
      }
    end

    it "creates a processing with the right params" do
      expect(last_processing.title).to eq("Dummy title")
      expect(last_processing.client).to eq("Dummy client")
      expect(last_processing.url).to eq("Dummy url")
      expect(last_processing.user).to eq(user)
    end

    it "redirects to preprocessing show" do
      expect(response).to redirect_to("http://www.example.com/preprocessings/#{last_processing.id}")
    end

    context "when title is nil" do
      let(:title) { nil }

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT /preprocessings" do
    let(:new_title) { "#{title} new" }

    before do
      put "/preprocessings/#{processing.id}", params: {
        processing: {
          title: new_title,
          client:,
          url:,
          file:
        }
      }

      processing.reload
    end

    it "updates the processing with the right params" do
      expect(processing.title).to eq("Dummy title new")
      expect(processing.client).to eq("Dummy client")
      expect(processing.url).to eq("Dummy url")
    end

    it "renders the show template" do
      expect(response).to redirect_to("http://www.example.com/preprocessings/#{processing.id}")
    end

    context "when title is nil" do
      let(:new_title) { nil }

      it "renders the new template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE /preprocessing" do
    before { delete "/preprocessings/#{processing.id}" }

    it "destroys processing" do
      expect(Processing.where(id: processing.id)).to eq([])
    end

    it "renders the show template" do
      expect(response).to redirect_to("/preprocessings")
    end
  end
end
