class CreateMolBiolChemicals < ActiveRecord::Migration[5.0]
  def change
    create_table :mol_biol_chemicals do |t|
      t.string :name
      t.string :producer
      t.string :catalogue_number
      t.string :quantity
      t.date :delivery_date
      t.string :place
      t.text :comments

      t.timestamps
    end
  end
end
