class CreateContentBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :content_blocks do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :block_type
      t.integer :position
      t.text :content

      t.timestamps
    end
  end
end
