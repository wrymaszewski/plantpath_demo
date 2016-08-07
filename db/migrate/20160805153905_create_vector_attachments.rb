class CreateVectorAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :vector_attachments do |t|
      t.string :name
      t.string :file_type
      t.string :file
      t.text :comments
      t.references :vector, foreign_key: true

      t.timestamps
    end
  end
end
