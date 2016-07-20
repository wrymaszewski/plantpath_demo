json.array!(@sequences) do |sequence|
  json.extract! sequence, :id, :name
  json.url sequence_url(sequence, format: :json)
end
