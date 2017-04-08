class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :url
      t.string :name
      t.string :author
      t.string :manual
      t.text :comments

      t.timestamps
    end
  end
end
