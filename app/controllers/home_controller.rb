class HomeController < ApplicationController
  # GET /
  def index
    # Show featured courses for public access
    @featured_courses = Course.published.includes(:lessons).limit(6).order(created_at: :desc)
    # If user is logged in and is a designer, show their recent courses
    # TODO: Implement authentication - for now, skip user-specific content
    # if current_user&.designer?
    #   @my_courses = current_user.courses.includes(:lessons).limit(3).order(updated_at: :desc)
    # end
  end
end
