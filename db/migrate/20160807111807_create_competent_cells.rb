class CreateCompetentCells < ActiveRecord::Migration[5.0]
  def change
    create_table :competent_cells do |t|
      t.string :place
      t.string :species
      t.string :strain
      t.string :genotype
      t.string :antibiotic_resistance
      t.string :usage
      t.text :comments

      t.timestamps
    end
  end
end
