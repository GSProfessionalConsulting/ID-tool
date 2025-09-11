class AddFieldsToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :learning_objectives, :text
    add_column :courses, :target_audience, :string
    add_column :courses, :estimated_duration, :string
  end
end
