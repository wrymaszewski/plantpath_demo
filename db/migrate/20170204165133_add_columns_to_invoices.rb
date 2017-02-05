class AddColumnsToInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :invoices, :cat_no, :string
  	add_column :invoices, :supplier, :string
  	add_column :invoices, :category_1, :string
  	add_column :invoices, :category_2, :string
  	add_column :invoices, :name, :string
  	add_column :invoices, :price, :float
  	add_column :invoices, :date, :date
  	add_column :invoices, :comments, :text
  end
end
