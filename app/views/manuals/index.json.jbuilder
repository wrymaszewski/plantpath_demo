json.array!(@manuals) do |manual|
  json.extract! manual, :id, :title, :author, :file, :comments
  json.url manual_url(manual, format: :json)
end
