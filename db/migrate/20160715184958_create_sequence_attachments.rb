class CreateSequenceAttachments < ActiveRecord::Migration
  def change
    create_table :sequence_attachments do |t|
      t.string :name
      t.integer :sequence_id
      t.string :sequence_type
      t.string :file
      t.text :comment

      t.timestamps null: false
    end
  end
end
