class LearnController < ApplicationController
  before_action :set_course, only: [ :course, :lesson ]
  before_action :ensure_course_published, only: [ :course, :lesson ]
  before_action :set_lesson, only: [ :lesson ]

  # GET /learn/catalog
  def catalog
    @courses = Course.published.includes(:lessons).order(created_at: :desc)
  end

  # GET /learn/course/:course_id
  def course
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
    @current_lesson = @lessons.first

    # Redirect to first lesson if available
    if @current_lesson
      redirect_to learn_lesson_path(@course, @current_lesson)
    else
      render :course
    end
  end

  # GET /learn/course/:course_id/lesson/:lesson_id
  def lesson
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
    @content_blocks = @lesson.content_blocks.order(:position)

    # Navigation helpers
    @previous_lesson = @lesson.previous_lesson
    @next_lesson = @lesson.next_lesson
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:lesson_id])
  end

  def ensure_course_published
    unless @course.published?
      redirect_to learn_catalog_path, alert: "This course is not available."
    end
  end
end
