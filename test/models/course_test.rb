require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = users(:designer_user)
    course = Course.new(
      title: "Test Course",
      description: "A valid course description that meets minimum length requirements",
      status: "draft",
      user: user
    )
    assert course.valid?
  end

  test "should require title" do
    user = users(:designer_user)
    course = Course.new(description: "Valid description", status: "draft", user: user)
    assert_not course.valid?
    assert_includes course.errors[:title], "can't be blank"
  end

  test "should require description" do
    user = users(:designer_user)
    course = Course.new(title: "Valid Title", status: "draft", user: user)
    assert_not course.valid?
    assert_includes course.errors[:description], "can't be blank"
  end

  test "should validate title length" do
    user = users(:designer_user)
    course = Course.new(title: "ab", description: "Valid description", status: "draft", user: user)
    assert_not course.valid?
    assert_includes course.errors[:title], "is too short (minimum is 3 characters)"
  end

  test "should validate description length" do
    user = users(:designer_user)
    course = Course.new(title: "Valid Title", description: "short", status: "draft", user: user)
    assert_not course.valid?
    assert_includes course.errors[:description], "is too short (minimum is 10 characters)"
  end
end
