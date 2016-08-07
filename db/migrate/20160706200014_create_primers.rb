class CreatePrimers < ActiveRecord::Migration
  def change
    create_table :primers do |t|
      t.string :name
      t.string :p_sequence
      t.string :direction
      t.integer :length
      t.integer :position
      t.float :Tm
      t.string :gene_sequence
      t.text :comments
      t.string :place
      t.references :sequence, foreign_key: true

      t.timestamps null: false
    end
  end
end
