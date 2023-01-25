# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Documents", type: :request do
  let!(:user) { create(:user) }
  let!(:document) { create(:document) }

  before do
    login_as(user)
  end

  describe "GET /documents" do
    before do
      get "/documents"
    end

    it "assigns documents" do
      expect(assigns(:documents)).to eq([document])
    end

    it "render home template" do
      expect(response).to render_template(:index)
    end
  end

  describe "POST /documents" do
    let(:title) { "dummy_title" }

    before do
      post "/documents", params: { document: { title: } }
    end

    it "assigns documents" do
      expect(assigns(:documents)).not_to eq([document])
    end

    it "redirects to show" do
      expect(response).to redirect_to("/documents/#{Document.last.id}")
    end

    context "when document is invalid" do
      let(:title) { nil }

      it "render home template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /documents/new" do
    before do
      get "/documents/new"
    end

    it "render home template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET /documents/:id/edit" do
    before do
      get "/documents/#{document.id}/edit"
    end

    it "assigns documents" do
      expect(assigns(:document)).to eq(document)
    end

    it "render home template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "GET /documents/:id" do
    before do
      get "/documents/#{document.id}"
    end

    it "assigns documents" do
      expect(assigns(:document)).to eq(document)
    end

    it "render show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "PUT /documents/:id" do
    let(:title) { "Dummy title" }

    before do
      put "/documents/#{document.id}", params: {
        document: { title: }
      }
    end

    it "assigns documents" do
      expect(assigns(:document)).to eq(document)
    end

    it "redirect to show" do
      expect(response).to redirect_to("/documents/#{document.id}")
    end

    context "when document is invalid" do
      let(:title) { nil }

      it "render edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /documents/:id" do
    before do
      delete "/documents/#{document.id}"
    end

    it "assigns documents" do
      expect(assigns(:document)).to eq(document)
    end

    it "redirects to documents" do
      expect(response).to redirect_to("/documents")
    end

    it "destroys document" do
      expect(Document.where(id: document.id)).to eq([])
    end
  end

  describe "/process_archive" do
    before do
      allow(ProcessDocumentJob).to receive(:perform_later).with(document.id).and_return(true)
      post "/documents/#{document.id}/process_archive", params: {}
    end

    it "redirects to document show" do
      expect(response).to redirect_to("/documents/#{document.id}")
    end
  end
end
