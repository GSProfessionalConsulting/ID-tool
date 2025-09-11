require "test_helper"

class LessonTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    course = Course.create!(title: "Test Course", description: "Valid description", status: "draft")
    lesson = Lesson.new(
      title: "Test Lesson",
      course: course,
      position: 1,
      lesson_type: "content"
    )
    assert lesson.valid?
  end

  test "should require title" do
    course = Course.create!(title: "Test Course", description: "Valid description", status: "draft")
    lesson = Lesson.new(course: course, position: 1, lesson_type: "content")
    assert_not lesson.valid?
    assert_includes lesson.errors[:title], "can't be blank"
  end

  test "should require positive position" do
    course = Course.create!(title: "Test Course", description: "Valid description", status: "draft")
    lesson = Lesson.new(title: "Test Lesson", course: course, position: 0, lesson_type: "content")
    assert_not lesson.valid?
    assert_includes lesson.errors[:position], "must be greater than 0"
  end

  test "should require unique position within course" do
    course = Course.create!(title: "Test Course", description: "Valid description", status: "draft")
    Lesson.create!(title: "First Lesson", course: course, position: 1, lesson_type: "content")

    duplicate_lesson = Lesson.new(title: "Second Lesson", course: course, position: 1, lesson_type: "content")
    assert_not duplicate_lesson.valid?
    assert_includes duplicate_lesson.errors[:position], "has already been taken"
  end
end
