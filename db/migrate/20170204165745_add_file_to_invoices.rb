class AddFileToInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :invoices, :file, :string
  end
end
