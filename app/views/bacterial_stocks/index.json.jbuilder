json.array!(@bacterial_stocks) do |bacterial_stock|
  json.extract! bacterial_stock, :id, :number, :insert, :plasmid, :tag, :species, :strain, :antibiotic_resistance, :methods_of_cloning, :source, :comments, :references
  json.url bacterial_stock_url(bacterial_stock, format: :json)
end
