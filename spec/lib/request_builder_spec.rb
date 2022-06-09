# frozen_string_literal: true

require "rails_helper"

RSpec.describe RequestBuilder do
  subject { described_class }
  let(:url) { "https://dummycall.org" }
  let(:uri) { URI(url) }
  let(:content) { { foo: "bar" } }

  before do
    stub_request(:post, url).with(body: JSON.dump(content),).to_return(status: 200, body: JSON.dump(content), headers: {})
  end

  it "sends a request" do
    expect(subject.send_post_request(content, uri).response.code).to eq("200")
  end

  it "returns response" do
    expect(subject.send_post_request(content, uri).response.body).to eq(JSON.dump(content))
  end
end
