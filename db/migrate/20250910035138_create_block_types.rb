class CreateBlockTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :block_types do |t|
      t.string :name
      t.text :description
      t.text :config_schema

      t.timestamps
    end
  end
end
