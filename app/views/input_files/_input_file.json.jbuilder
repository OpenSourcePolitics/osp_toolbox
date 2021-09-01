# frozen_string_literal: true

json.extract! input_file, :id, :file, :type, :created_at, :updated_at
json.url input_file_url(input_file, format: :json)
json.file url_for(input_file.file)
