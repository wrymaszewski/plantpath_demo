json.array!(@mol_biol_chemicals) do |mol_biol_chemical|
  json.extract! mol_biol_chemical, :id, :name, :producer, :catalogue_number, :quantity, :delivery_date
  json.url mol_biol_chemical_url(mol_biol_chemical, format: :json)
end
