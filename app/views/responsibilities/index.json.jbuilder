json.array!(@responsibilities) do |responsibility|
  json.extract! responsibility, :id, :first_name, :last_name, :action, :data_of_action, :comments
  json.url responsibility_url(responsibility, format: :json)
end
