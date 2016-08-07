json.extract! vector_attachment, :id, :name, :type, :file, :vector_id, :created_at, :updated_at
json.url vector_attachment_url(vector_attachment, format: :json)