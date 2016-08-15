class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :name
      t.string :organism
      t.text :comments

      t.timestamps null: false
    end
  end
end
