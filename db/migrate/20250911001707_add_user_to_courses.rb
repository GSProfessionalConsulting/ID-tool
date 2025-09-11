class AddUserToCourses < ActiveRecord::Migration[8.0]
  def change
    # First add the column as nullable
    add_reference :courses, :user, null: true, foreign_key: true

    # Create a default admin user if none exists
    unless User.exists?
      default_user = User.create!(
        email: 'admin@localhost.com',
        password: 'password123',
        password_confirmation: 'password123',
        first_name: 'Admin',
        last_name: 'User',
        role: 'admin'
      )

      # Assign all existing courses to this user
      Course.update_all(user_id: default_user.id)
    end

    # Now make the column non-nullable
    change_column_null :courses, :user_id, false
  end
end
