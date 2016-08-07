class CreateVectors < ActiveRecord::Migration[5.0]
  def change
    create_table :vectors do |t|
      t.string :name
      t.integer :size
      t.string :antibiotic_resistance
      t.string :copy_number
      t.string :usage
      t.string :tag
      t.text :casette
      t.text :comments

      t.timestamps
    end
  end
end
