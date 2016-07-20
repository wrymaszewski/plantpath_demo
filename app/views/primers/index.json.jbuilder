json.array!(@primers) do |primer|
  json.extract! primer, :id, :name, :plasmid, :sequence, :Tm, :comments
  json.url primer_url(primer, format: :json)
end
