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
      t.string :quantity
      t.text :comments
      t.string :rodzaj
      t.string :state

      t.timestamps
    end
  end
end
