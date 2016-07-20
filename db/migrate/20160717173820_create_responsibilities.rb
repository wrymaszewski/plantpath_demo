class CreateResponsibilities < ActiveRecord::Migration[5.0]
  def change
    create_table :responsibilities do |t|
      t.string :first_name
      t.string :last_name
      t.string :action
      t.date :date_of_action
      t.text :comments
      t.boolean :done

      t.timestamps
    end
  end
end
