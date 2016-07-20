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
      t.references :sequence, foreign_key: true
      t.boolean :checked, default: false

      t.timestamps null: false
    end
  end
end
