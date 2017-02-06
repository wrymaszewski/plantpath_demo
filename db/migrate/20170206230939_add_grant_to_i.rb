class AddGrantToI < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :grant, :string
  end
end
