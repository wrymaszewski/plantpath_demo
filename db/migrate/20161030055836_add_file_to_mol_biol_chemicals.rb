class AddFileToMolBiolChemicals < ActiveRecord::Migration[5.0]
  def change
  	add_column :mol_biol_chemicals, :file, :string
  end
end
