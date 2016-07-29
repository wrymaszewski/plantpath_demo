class FixColumnNameInsert < ActiveRecord::Migration[5.0]
  def change
  	rename_column :bacterial_stocks, :insert, :wstawka
  end
end
