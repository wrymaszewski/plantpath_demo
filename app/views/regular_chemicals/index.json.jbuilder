json.array!(@regular_chemicals) do |regular_chemical|
  json.extract! regular_chemical, :id, :short_name, :full_name, :formula, :producer, :catalogue_number, :delivery_date, :comments
  json.url regular_chemical_url(regular_chemical, format: :json)
end
