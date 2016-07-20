class CreateRegularChemicals < ActiveRecord::Migration[5.0]
  def change
    create_table :regular_chemicals do |t|
      t.string :short_name
      t.string :full_name
      t.string :formula
      t.string :producer
      t.string :catalogue_number
      t.date :delivery_date
      t.string :place
      t.text :comments

      t.timestamps
    end
  end
end
