class PublicController < ApplicationController
  before_action :set_course, only: [ :course, :lesson ]
  before_action :ensure_course_published, only: [ :course, :lesson ]
  before_action :set_lesson, only: [ :lesson ]

  # GET /course/:course_id
  def course
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
    @current_lesson = @lessons.first

    # Redirect to first lesson if available
    if @current_lesson
      redirect_to public_lesson_path(@course, @current_lesson)
    else
      render :course
    end
  end

  # GET /course/:course_id/lesson/:lesson_id
  def lesson
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
    @content_blocks = @lesson.content_blocks.includes(:block_type).order(:position)

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
      redirect_to root_path, alert: "This course is not available."
    end
  end
end
