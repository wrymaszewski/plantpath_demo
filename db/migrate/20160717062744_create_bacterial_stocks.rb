class CreateBacterialStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :bacterial_stocks do |t|
      t.integer :number
      t.string :insert
      t.string :sequence_name
      t.string :plasmid
      t.string :tag
      t.string :species
      t.string :strain
      t.string :antibiotic_resistance
      t.string :methods_of_cloning
      t.string :source
      t.text :comments
      t.string :place
      t.references :sequence, foreign_key: true

      t.timestamps
    end
  end
end
