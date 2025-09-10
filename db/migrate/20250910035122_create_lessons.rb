class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.integer :lesson_type
      t.integer :position

      t.timestamps
    end
  end
end
