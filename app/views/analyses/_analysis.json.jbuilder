# frozen_string_literal: true

json.extract! analysis, :id, :created_at, :updated_at
json.url analysis_url(analysis, format: :json)
