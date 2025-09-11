class Designer::CoursesController < ApplicationController
  before_action :set_course, only: [ :show, :edit, :update, :destroy, :preview, :export, :publish ]
  before_action :ensure_designer_access, only: [ :index, :new, :create ]
  before_action :ensure_course_ownership, only: [ :show, :edit, :update, :destroy, :preview, :export, :publish ]

  # GET /designer/courses
  def index
    # TODO: Replace with current_user.courses when authentication is implemented
    @courses = Course.includes(:lessons).order(created_at: :desc)
  end

  # GET /designer/courses/1
  def show
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
  end

  # GET /designer/courses/new
  def new
    # TODO: Replace with current_user.courses.build when authentication is implemented
    @course = Course.new
  end

  # POST /designer/courses
  def create
    # TODO: Replace with current_user.courses.build when authentication is implemented
    @course = Course.new(course_params)

    if @course.save
      redirect_to designer_course_path(@course), notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /designer/courses/1/edit
  def edit
  end

  # PATCH/PUT /designer/courses/1
  def update
    if @course.update(course_params)
      redirect_to designer_course_path(@course), notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /designer/courses/1
  def destroy
    if @course.destroy
      redirect_to designer_courses_path, notice: "Course was successfully deleted."
    else
      redirect_to designer_course_path(@course), alert: "Failed to delete course. Please try again."
    end
  end

  # GET /designer/courses/1/preview
  def preview
    @lessons = @course.lessons.includes(:content_blocks).order(:position)
    render layout: "learner"
  end

  # GET /designer/courses/1/export
  def export
    respond_to do |format|
      format.html
      format.json { render json: @course.to_json(include: { lessons: { include: :content_blocks } }) }
      format.pdf { render pdf: "#{@course.title.parameterize}.pdf" }
    end
  end

  # POST /designer/courses/1/publish
  def publish
    if @course.update(status: :published)
      redirect_to designer_course_path(@course), notice: "Course was successfully published."
    else
      redirect_to designer_course_path(@course), alert: "Failed to publish course."
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :status, :learning_objectives, :target_audience, :estimated_duration).tap do |allowed_params|
      # Ensure status is valid if provided
      if allowed_params[:status].present? && !Course.statuses.key?(allowed_params[:status])
        allowed_params.delete(:status)
      end
    end
  end

  def ensure_designer_access
    # TODO: Implement authentication check
    # redirect_to root_path unless current_user&.designer?
  end

  def ensure_course_ownership
    # TODO: Implement ownership check
    # redirect_to designer_courses_path unless @course.user == current_user
  end
end
