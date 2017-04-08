json.extract! app, :id, :url, :name, :author, :manual, :comments, :created_at, :updated_at
json.url app_url(app, format: :json)