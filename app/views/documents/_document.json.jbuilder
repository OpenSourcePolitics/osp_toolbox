json.extract! document, :id, :title, :user_id, :created_at, :updated_at
json.url document_url(document, format: :json)
