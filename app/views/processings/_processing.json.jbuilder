# frozen_string_literal: true

json.extract! processing, :id, :created_at, :updated_at
json.url processing_url(processing, format: :json)
