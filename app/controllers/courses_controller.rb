class CoursesController < ApplicationController
  # This controller is now deprecated in favor of Designer::CoursesController
  # Keeping for backward compatibility during development
  
  def index
    # Redirect to designer courses if user is a designer
    if current_user&.designer?
      redirect_to designer_courses_path
    else
      # Redirect to learn catalog for regular users
      redirect_to learn_catalog_path
    end
  end
end
