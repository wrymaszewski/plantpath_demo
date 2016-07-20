class CreateManuals < ActiveRecord::Migration[5.0]
  def change
    create_table :manuals do |t|
      t.string :title
      t.string :author
      t.string :file
      t.string :comments

      t.timestamps
    end
  end
end
